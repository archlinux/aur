# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=1.4.1
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::https://github.com/IBM/plex/releases/download/v$pkgver/OpenType.zip")
sha256sums=('6d47e4d12895c9f56ce783488d18b4aa69c210e8d69867c8d397722cd0de4ea3')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
  install -d "${pkgdir}"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/OTF \;
}
