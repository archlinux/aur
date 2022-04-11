# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
_pkgname=siji
pkgname="${_pkgname}-ng"
pkgver=1.2
pkgrel=1
pkgdesc='A fixed and maintained Siji.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "neo${_pkgname}")
arch=('any')
url="https://github.com/begss/${pkgname}"
license=('GPL2')
makedepends=('xorg-bdftopcf' 'python3')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('01c12d033b9cca98ff9292951149949ecee85c9d14cd859ad260e050a40230ecc00c683a905459d0254115d578265a5ea67a81ea4b11e442f41078c45eb192dc')

build() {
  cd "${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/misc" "${_pkgname}.pcf" "${_pkgname}.otb"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
