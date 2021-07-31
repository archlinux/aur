# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
_pkgname=siji
pkgname="${_pkgname}-ng"
pkgver=1.1
pkgrel=1
pkgdesc='A fixed and maintained Siji.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "neo${_pkgname}")
arch=('any')
url="https://github.com/begss/${pkgname}"
license=('GPL2')
makedepends=('xorg-bdftopcf' 'python3')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('00eecb55cf777c1a6d767e5785f1b16f38e740b2b25502c48f3117eda1ce2c835a49ec6c8ac5c553181ae21de88c84e9a48b77e01b1b01e306955da8a5ad70ac')

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
