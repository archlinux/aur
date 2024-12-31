# Maintainer:

## links
# https://ares-emu.net/
# https://github.com/ares-emulator/ares

## options
: ${_build_avx:=true}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="ares-emu"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=141.r46.g8433666
pkgrel=1
pkgdesc="Multi-system emulator focused on accuracy and preservation"
url="https://github.com/ares-emulator/ares"
license=("ISC")
arch=('x86_64')

if [ "${_build_git::1}" != "t" ]; then
  source "PKGBUILD.stable"
else
  source "PKGBUILD.git"
fi

source+=(
  'PKGBUILD.git'
  'PKGBUILD.stable'
)
sha256sums+=(
  'SKIP'
  'SKIP'
)
