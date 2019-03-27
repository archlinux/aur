# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=1.3.1
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::https://github.com/IBM/plex/releases/download/v$pkgver/OpenType.zip")
sha256sums=('567a75b1eb02df4ecef516b1e9a34534f0c721b658427aabdddd38f41228e74b')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
  install -d "${pkgdir}"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/OTF \;
}
