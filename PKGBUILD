# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

: ${_build_git:=false}
: ${_canary:=false}

: ${_install_path:=usr/lib}
: ${startdir:=.}

_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.2.78
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/Ryubing/Ryujinx"
license=('MIT')
arch=('x86_64')

source "$startdir"/PKGBUILD.common

if [[ "${_build_git::1}" == "t" ]]; then
  source "$startdir"/PKGBUILD.git
elif [[ "${_canary::1}" == "t" ]]; then
  _autoupdate=true
  source "$startdir"/PKGBUILD.canary
else
  source "$startdir"/PKGBUILD.release
fi

_update_version
_source_ryujinx

source+=(
  PKGBUILD.canary
  PKGBUILD.common
  PKGBUILD.git
  PKGBUILD.release
)
sha256sums+=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
