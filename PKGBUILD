# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=6.1.1
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://github.com/IBM/plex"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::$url/releases/download/v$pkgver/OpenType.zip")
sha256sums=('c936ece46d39a1cb281d3c37881c7269500fcda5c5bbedcbc7cf289898ea36fd')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
  install -d "$pkgdir"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
}
