# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.1.3
pkgrel=1
url="https://ibm.github.io/type/"
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in truetype format"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=('c17ead46270e0bdb86e6e0923af0fa9c711007e5fed4a045e96deb7c0d535a2c')

package() {
  cd plex-${pkgver}
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/TTF
  find . -name "*.ttf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/TTF \;
}
