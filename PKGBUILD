# Maintainer: Damian Nowak <spam@nowaker.net>
#
# Purpose: a testing-only GNU bash 3.2.57 binary that mirrors the bash that
# ships with macOS (Apple froze bash at 3.2.57 in 2007 due to GPLv3). Useful
# when writing portable shell scripts that must work on macOS - you can run
# `bash3.2.57 ./your-script.sh` locally and see exactly how it would behave
# on a stock macOS host.
#
# This package deliberately does NOT replace the system bash. The binary is
# installed as /usr/bin/bash3.2.57 (with the version in the name), no `sh`
# symlink, no /etc/bash.* config files, no readline rebuild.

pkgname=bash-3.2.57-macos
pkgver=3.2.57
pkgrel=1
pkgdesc='GNU bash 3.2.57 (the version shipped with macOS) for portability testing, installed alongside the system bash as bash3.2.57'
arch=('x86_64')
url='https://www.gnu.org/software/bash/'
# bash 3.2 is licensed GPLv2+. Later bash (4.0+) moved to GPLv3+, which is
# why Apple froze at 3.2. This package is therefore GPL-2.0-or-later.
license=('GPL-2.0-or-later')
depends=('glibc' 'ncurses' 'readline')
makedepends=('patch')
# Do NOT list `bash` under provides/conflicts - we install as bash3.2.57, a
# separate binary. The stock bash must keep working.
source=("https://ftp.gnu.org/gnu/bash/bash-3.2.tar.gz")
sha256sums=('26c99025b59e30779300b68adb764f824974d267a4d7cc1b347d14a2393f9fb4')

# Official upstream patches 001..057, each applied in order, cumulatively
# making 3.2 -> 3.2.57. Listed individually so makepkg verifies each hash.
_patches=({001..057})
for _p in "${_patches[@]}"; do
  source+=("https://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-${_p}")
done
sha256sums+=(
  'beda60ce6186fafa36cd0a98db9ced42cff68daee4342cca73167fb0f2f43eaa'  # 001
  'a0ca49a3c47678ad074c990bdc871fcec680749b7f04f2def6527f04c589c40a'  # 002
  '7ec9e5e7e402e43b12bfd3a9237f4f171029fc7f58e59335abf3ccb455a5a84d'  # 003
  '3de0938673637089c3b0f0f355de377bb2be2d3fca68053dda267ca11b5998f2'  # 004
  'e7fecdecb12320cd6fe9aca83fab1828b76aeb5313b991883764cb9139d845b7'  # 005
  '8f14f81ced32bc057bc10abf6842f4a5ac172816631f2b87a5a3be4f01c0847d'  # 006
  '6863a712e5a68eccfb77162a9f947ffd80af648f0124c38f795ebba2be12eff8'  # 007
  'ccf303b4d199d89d5efc659235f8a645376e86d294260dda4becbb61ec06667b'  # 008
  'ef30c579419106b4b4a2d0064ef7e57ceee6cdf657f4ccd7b89c8e4fd70560d8'  # 009
  'bb7df9fefe88d62ee371353edf62402a667cffba6ea202aa1c8b220308a0c612'  # 010
  '85bf656cfc49b1447b061341a4b1cb93ba89a41d8d1699a65aa971d1853ba472'  # 011
  '45ef4ad98f2f218aa3acec15842ae1b833769c1dbe2f90c9bba00bbe4949fc43'  # 012
  '9fbf893c383f45d25e5bc5c9eae8d2b349521f288945b3bd21c781784b81f693'  # 013
  '62bb1a4d70f6f7938ca70a6aa7fe6f4b377ab5f450c7756b22b41de3bbd98ed6'  # 014
  'de40425e83628eb7431f39340ac09b42b5fcf484a565352851961b3e917d8771'  # 015
  '7abf66bbba3ebd6b6428190f3ebca59abdc0bfa3957f1a725489de7391c2d9f1'  # 016
  '951aa2a07b38db8eea8e7368d3ac36af60af7f5ade455215006229ce3815dfe0'  # 017
  'c85e2bca6084a79774adbf801698c62905662836334e54355b77fbf1c529074c'  # 018
  'd83f1d740cb103be444589dcd9da61c2802815e8c256a01cfa7e484c50a9eb85'  # 019
  '3e66a1d05566d5501c2f868d3c94b8d71821a21d0daf9baaf594369697793013'  # 020
  'a5e54704e6867c969a3e60556a5fbacedecca7404c3ddbe8180a92b6898a2a58'  # 021
  '057e03d593b858637056c0458b168e9c012db914727abba964afcaf377f2c5a4'  # 022
  '869466d80807cde59c0eab9a39ef1909be4d5e8698ea1e3daa530ad59baaa97a'  # 023
  'd13c59fa6b182f79bbf9ba35f72085aeb755f9785985eaf9f4a55d58045fe327'  # 024
  'abfc1e1db3af956d4e71deb6a1ea9de1164c49fca4020b2546df3aa56f08cebe'  # 025
  '07985caacd6c150cf89c51965bd18db2c89a9f32f7a2aa946757007409c292b9'  # 026
  '79647e3af94db8c2e636a293ee5b2f12516560b12aac0d4568a125d36cd21ddf'  # 027
  '37289390175097c23efac5cb00d66b8b87e41fc37398064d11ac00de0e9934b0'  # 028
  '1f4e543171bd66bc28b197938811028ea70e9e406be2529326d2a586844b98e7'  # 029
  '5ed6ca19787f2285e0c080056f65a137e053387380b3d8f6133812dd8f824afb'  # 030
  '81ddc8f45e3272dd0e463fab87b58058be28d9c867674f3f53432dbd25cdfa48'  # 031
  '926a9115e5c885ff9f2ef8abc6c3c552652afc370ebf65a87f41ec6810bdb569'  # 032
  '9d7abee640dafbcdc6b75544015f3ffb5ed5aed2747465ec1412e959d3966740'  # 033
  'adc52e3427b606fe9649980b01c5b2b18f0509c4dd6d59a84f85b6a2989f9f8e'  # 034
  'd3d906b23fce195d5d6f0db8969fa5264e80a98b5460008d6a05e4156ca73953'  # 035
  'bdb24d65d1170234379fe587f5dc8b990c5e0c2d61c394bb8c81b91c1c64ce23'  # 036
  '9688a352c0fb23d2ce6e685ce39cda1c49f4aa7819bde2508ff8c90003f484df'  # 037
  '0e3649531c3a5675743980ecf5ff5fcbca2801afe4dca7fb4b250aae7ac3b782'  # 038
  '46d427fd5b1509ec7dd980c07efd88634fde61cf07ab221dcbde9e1021bd2817'  # 039
  'c9e0387eb4a2904126864d24de0699cdb6070789e1c02287a3b81ea96bf945aa'  # 040
  'cc551fa57d613efea30ab2404fe724793a3d10f012b030e611d2c6449e463bcd'  # 041
  'fd0df54d03034e104b6377f249624bda0271aa874190a46e9d41fc49ad3caaef'  # 042
  '43df7d2d7d61d3a8f0e14bc86d4f55b6d2e64829ba0829a78f5214d186087af7'  # 043
  '204b5ecaaa5de334c3cfbce6dfd8a9d3770b09024ab4724d86080fbf501ded69'  # 044
  '3250e6c6d5d6884e31beaa2f521d2a1af9c2f701a4c0e67a7cd011b6ad8f082b'  # 045
  'fc829e92fa951c34368d83272d746f5c0ed345a7ad037f93322347eed00a1e1f'  # 046
  '623d4a958d2b022a15929a4de7403766ff07b295a185987b4d1e6cf3b70ea106'  # 047
  '74cb56764274f393676f68738eb22a3ed8fa388c0487feeadf0d78a45b549749'  # 048
  'b1217ed94bdb95dc878fa5cabbf8a164435eb0d9da23a392198f48566ee34a2f'  # 049
  '081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3c078503609a1642'  # 050
  '354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef'  # 051
  'a0eccf9ceda50871db10d21efdd74b99e35efbd55c970c400eeade012816bb61'  # 052
  'fe6f0e96e0b966eaed9fb5e930ca12891f4380f30f9e0a773d200ff2063a864e'  # 053
  'c6dab911e85688c542ce75afc175dbb4e5011de5102758e19a4a80dac1e79359'  # 054
  'c0e816700837942ed548da74e5917f74b70cbbbb10c9f2caf73e8e06a0713d0a'  # 055
  '063a8d8d74e4407bf07a32b965b8ef6d213a66abdb6af26cc3584a437a56bbb4'  # 056
  '5fc689394d515990f5ea74e2df765fc6e5e42ca44b4591b2c6f9be4b0cadf0f0'  # 057
)

prepare() {
  cd "bash-3.2"
  # Apply official GNU patches in order. Each patch is applied with `-p0`
  # (default bash-patch convention). A failure here is a real problem; do
  # not mask it.
  for _p in "${_patches[@]}"; do
    patch -p0 -i "../bash32-${_p}"
  done
}

build() {
  cd "bash-3.2"

  # Build flags for modern GCC (15.x) + glibc (2.40+). Bash 3.2 source uses
  # pre-ANSI / K&R C conventions that modern GCC rejects as errors by
  # default. Specifically:
  #
  #   -std=gnu89         Tell GCC to interpret the source as 1990-vintage
  #                      C. Declarations like `extern int list_reverse ()`
  #                      are treated as "unspecified args" rather than
  #                      "takes zero args", matching what bash 3.2 expects
  #                      and what GCC 4.x / the original 2007 build did.
  #   _GNU_SOURCE        Ensures strsignal() and related prototypes are
  #                      visible; bash 3.2 references sys_siglist/sys_nerr
  #                      but glibc 2.32+ hides them, and _GNU_SOURCE
  #                      exposes the modern replacements.
  #   -Wno-*             Silence noisy warnings that remain after -std=gnu89
  #                      so the log stays readable.
  #
  # Bash's own malloc is disabled (--without-bash-malloc) because it
  # collides with glibc's on modern Linux.
  #
  # CFLAGS_FOR_BUILD (Makefile var) is needed separately because the
  # `mkbuiltins` / `psize` build-time tools are compiled with their own
  # flag set, not CFLAGS. Without matching -std=gnu89 there, those tools
  # fail to compile on modern GCC even if the main bash binary doesn't.
  _compat_flags="-std=gnu89 -D_GNU_SOURCE -Wno-implicit-function-declaration -Wno-implicit-int"
  export CFLAGS="${CFLAGS} ${_compat_flags}"
  export CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD:-} ${_compat_flags}"

  # Configure as an unprivileged, sandbox-free build. We don't need or want
  # /etc/bashrc, /etc/skel/*, or a `sh` symlink. Minimal install.
  ./configure \
    --prefix=/usr \
    --without-bash-malloc \
    --enable-readline \
    --with-curses \
    --with-installed-readline \
    --program-suffix=3.2.57

  make
}

package() {
  cd "bash-3.2"

  # Manual install of just the binary. The default `make install` also
  # installs manpages, info, /etc/bashrc, etc. - we don't need any of that
  # and avoiding it sidesteps the chance of overwriting system files.
  install -Dm755 bash "$pkgdir/usr/bin/bash3.2.57"

  # Informational: a tiny README under /usr/share/doc explaining what this
  # is and how to use it. Helps anyone who finds the binary later.
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cat > "$pkgdir/usr/share/doc/$pkgname/README.md" <<EOF
# bash 3.2.57 (macOS compatibility testing)

This package installs /usr/bin/bash3.2.57, GNU bash 3.2.57 compiled from
upstream source with all 57 official patches applied. It is the same
major.minor version that ships with macOS (Apple froze bash at 3.2.57 in
2007 to avoid GPLv3).

## Why

Shell scripts that target macOS must avoid bash 4.0+ features such as
associative arrays (\`declare -A\`), the \`&>\` shortcut with specific
semantics, mapfile / readarray, and so on. Running scripts under this
binary locally is a fast way to catch compatibility issues before a
macOS user hits them.

## Usage

    bash3.2.57 ./your-script.sh
    bash3.2.57 -c 'echo "version: \$BASH_VERSION"'

This binary does NOT replace /bin/bash or /usr/bin/bash. The system bash
remains in place and handles everything else.

## Testing check

    \$ /usr/bin/bash3.2.57 --version | head -1
    GNU bash, version 3.2.57(1)-release ...
EOF
}
