# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=5.1.3
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in otf format"
url="https://github.com/IBM/plex"
arch=('any')
license=('custom')
source=("${pkgname#otf-}-$pkgver-opentype.zip::$url/releases/download/v$pkgver/OpenType.zip")
sha256sums=('61085afbb80992cfcc9c529efb48e0c56e1a174826dda8de852492d2fb449f7e')

package() {
  cd OpenType
  install -Dm644 IBM-Plex-Sans/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/license.txt
  install -d "$pkgdir"/usr/share/fonts/OTF
  find . -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
}
