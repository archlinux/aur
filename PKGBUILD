# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.8.3
pkgrel=2
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
_extdir="proto_cli-${arch[0]}-unknown-linux-gnu"
source=("${_extdir}.tar.xz::${url}/releases/download/v${pkgver}/${_extdir}.tar.xz")
sha512sums=('393a35d1875fbb5ed88fa9b454d77bcf1b9e3e001f79b54d9a302a9144f03f3f8b16890624878caf12f1a2725cca6342019e3f7e11ff9c99f275451fcbcd9571')

package() {
  cd "${_extdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
