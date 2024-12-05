# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

: ${_install_path:=usr/lib}
: ${_canary:=false}
: ${startdir:=.}

_pkgname="ryujinx"
pkgver=1.2.76
pkgrel=2
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/GreemDev/Ryujinx"
license=('MIT')
arch=('x86_64')

if [[ "${_canary::1}" == "t" ]]; then
  _autoupdate=true
  source "$startdir"/PKGBUILD.canary
else
  source "$startdir"/PKGBUILD.release
fi

source "$startdir"/PKGBUILD.common

_update_version
_source_ryujinx

source+=(
  PKGBUILD.canary
  PKGBUILD.common
  PKGBUILD.release
)
sha256sums+=(
  'SKIP'
  'SKIP'
  'SKIP'
)
