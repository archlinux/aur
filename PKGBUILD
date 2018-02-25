# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=1.0.0
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBM/type/archive/v$pkgver.tar.gz")
md5sums=('0d8ffdb1ed963038c3c03bb3182e4ec6')

package() {
  cd plex-${pkgver}
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
  install -d "${pkgdir}"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/OTF \;
}
