%%% Prolog program for the simplified plumbing example....

% Copyright David L Poole 2018.
% This work is licensed under a Creative Commons
% Attribution-NonCommercial-ShareAlike 4.0 International License.
% See: http://creativecommons.org/licenses/by-nc-sa/4.0/deed.en_US.

% The dynamic declaration prevents undefined predicate errors.
:- dynamic on_t1/0, on_t2/0, off_t1/0, off_t2/0, plugged_bath/0,
	unplugged_bath/0, plugged_sink/0, unplugged_sink/0.

% See assignment description for the intended interpretation of the symbols
pressurized_p1.
pressurized_p4.




% You can change the status of taps and plugs by adding or removing (commenting out) statements:
on_t1.
on_t2.
on_t3.
on_t4. % tap between hot water system and connection to p1
unplugged_bath.
unplugged_sink.
%plugged_bath.
%plugged_sink.

pressurized_p2 :- on_t1, pressurized_p1;on_t4, pressurized_p4.
% p3 is pressurized if t1 is on
pressurized_p3 :- on_t1, pressurized_p1;on_t4, pressurized_p4.
flow_shower :- on_t2, pressurized_p2.
wet_bath :- flow_shower. flow_d2 :- wet_bath,
unplugged_bath.
% added sink drain connection to main drain
flow_d1 :- flow_d2;flow_d3.

% the sink faucet flows if it is on and p3 is pressurized
flow_faucet :- on_t3, pressurized_p3.
% the sink is wet if t3 flows
wet_sink :- flow_faucet.
% the sink drains if it is wet and unplugged
flow_d3 :- wet_sink, unplugged_sink.
% the bath and/or sink will overflow if they are both wet and plugged.
overflowing_bath :- wet_bath, plugged_bath.
overflowing_sink :- wet_sink, plugged_sink.

% the floor is wet if either the sink or the shower are both wet and plugged
wet_floor :- overflowing_bath; overflowing_sink.
