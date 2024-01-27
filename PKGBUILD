# Contributor: pyjano <pyjano at protonmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>

pkgname=otf-ibm-plex
pkgver=6.4.0
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://github.com/IBM/plex"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::$url/releases/download/v$pkgver/OpenType.zip")
sha256sums=('e8e502823a9c6c7dda9ebb1710c5f6c4001db4ab15067d9ec373a6d39844fc1d')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
  install -d "$pkgdir"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
}
