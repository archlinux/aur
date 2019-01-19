# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=1.2.3
pkgrel=2
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::https://github.com/IBM/plex/releases/download/v$pkgver/OpenType.zip")
sha256sums=('223720801bbc9247c3a8ec11a1c63466bcdce90e8337aef94cc930e2374bdbba')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
  install -d "${pkgdir}"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/OTF \;
}
