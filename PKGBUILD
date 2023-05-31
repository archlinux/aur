# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.10.0
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
_extdir="proto_cli-${arch[0]}-unknown-linux-gnu"
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_extdir}.tar.xz")
sha512sums=('4718b86084e3c79168cb90cd606f223f08e9aa6ccbf7c06466bab212ce7e19aa2601fdf0577298cba46ad6adff8bbbba436dcee2f5b2346b36a5548c64e2c104')

package() {
  cd "${_extdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
