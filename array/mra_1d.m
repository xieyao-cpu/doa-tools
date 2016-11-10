function design = mra_1d(n, d, name)
%MRA_1D generates a 1D minimum redundancy array.
%Syntax:
%   design = MRA_1D(n, wavelength/2, 'MRA');
%Inputs:
%   n - Number of array elements. Supports up to 20 elements.
%   d - Inter-element spacing.
%   name - Custom name of the array. Default is 'MRA with n elements'.
%Outputs:
%   design - An array design struct.
if d <= 0 || ~isreal(d)
    error('d must be a positive real number.');
end
if nargin <= 2
    name = sprintf('MRA with %d elements', n);
elseif ~ischar(name)
    error('Name must be a string.');
end

persistent mra_designs;
if isempty(mra_designs)
    mra_designs = { ...
        [0], ...
        [0 1], ...
        [0 1 3], ...
        [0 1 4 6], ...
        [0 1 4 7 9], ...
        [0 1 6 9 11 13], ...
        [0 1 8 11 13 15 17], ...
        [0 1 4 10 16 18 21 23], ...
        [0 1 4 10 16 22 24 27 29], ...
        [0 1 4 10 16 22 28 30 33 35], ...
        [0 1 6 14 22 30 32 34 37 39 41], ...
        [0 1 6 14 22 30 38 40 42 45 47 49], ...
        [0 1 6 14 22 30 38 46 48 50 53 55 57], ...
        [0 1 6 14 22 30 38 46 54 56 58 61 63 65], ...
        [0 1 6 14 22 30 38 46 54 62 64 66 69 71 73], ...
        [0 1 8 18 28 38 48 58 68 70 72 74 77 79 81 83], ...
        [0 1 8 18 28 38 48 58 68 78 80 82 84 87 89 91 93], ...
        [0 1 8 18 28 38 48 58 68 78 88 90 92 94 97 99 101 103], ...
        [0 1 8 18 28 38 48 58 68 78 88 98 100 102 104 107 109 111 113], ...
        [0 1 10 22 34 46 58 70 82 94 106 108 110 112 114 117 119 121 123 125] ...
    };
end

if n < 1 || n > length(mra_designs)
    error('Maximum number of elements supported is 20.');
end

design.element_indices = mra_designs{n};
design.element_positions = design.element_indices*d;
design.element_spacing = d;
design.element_count = length(design.element_indices);
design.dim = 1;
design.type = 'mra';
design.name = name;
end