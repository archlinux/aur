# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Chris van Dijk (quigybo) <quigybo at hotmail dot com>
# Contributor: Scott Olson <scott at scott-olson dot org>

pkgname=gist
pkgver=4.3.0
pkgrel=1
pkgdesc="Potentially the best command line gister"
url="https://github.com/defunkt/gist"
arch=('any')
license=('MIT')
depends=('ruby')
optdepends=(
  "xclip: put pasted gist's url into X selection automagically"
  "xsel: put pasted gist's url into X selection automagically"
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/defunkt/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('ffd09abbb6764722e8ed1eb6758c8a64e64a106133e5f2741d726e582ebb404306a23557fbb316d5d3d1f82c59ae1ecad8d628aade4a9b520a63e9d9e804dc5c')

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 build/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
