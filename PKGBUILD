# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=1.2.1
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::https://github.com/IBM/plex/releases/download/v$pkgver/OpenType.zip")
sha256sums=('88f445175cf038bfe11d629bb7f1ea278c82cecdbdff60c01cd0c397b03cee81')

package() {
  cd OpenType
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/OTF \;
}
