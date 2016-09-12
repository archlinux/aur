# Maintainer: Donald Carr <sirspudd at gmail dot com>

_aarch64=false

_pkgname=qpi
_toolchainname=armv7-rpi2-linux-gnueabihf
if $_aarch64; then
  _pkgname="$_pkgname-aarch64"
  _toolchainname=aarch64-rpi3-linux-gnueabi
fi
pkgname=${_pkgname}-toolchain
pkgver=6.1.0
pkgrel=3
pkgdesc="cross-tool-ng compiled GCC toolchain for the pi"
arch=("x86_64")
license=("GPL")
makedepends=("git")

_toolchainreponame=crosstool-ng-toolchains

url="https://github.com/sirspudd/${_toolchainreponame}"
source=("git+https://github.com/sirspudd/${_toolchainreponame}.git#tag=GCC-${pkgver}-${_toolchainname}")
sha256sums=("SKIP")
options=('!strip')

package() {
  local destdir="${pkgdir}/opt"
  mkdir -p "${destdir}"
  cp -r "${srcdir}/${_toolchainreponame}/${_toolchainname}" "${destdir}"
}
