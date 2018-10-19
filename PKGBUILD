# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.2.0
pkgrel=1
url="https://github.com/IBM/type"
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in truetype format"
arch=('any')
license=('custom')
source=("${pkgname#ttf-}-$pkgver.tar.gz::https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=('706cd2b38317869c4e96bc8fcbbab8ee1921e456f71a7bc8a79d9edf6a5de3ae')

package() {
  cd plex-${pkgver}
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/TTF
  find . -name "*.ttf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/TTF \;
}
