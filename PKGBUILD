# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.0.2
pkgrel=1
url="https://ibm.github.io/type/"
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in truetype format"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=('7bed06afec7edf9782302fda772613daf8025e996b739477b5b79daefec2565b')

package() {
  cd plex-${pkgver}
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/TTF
  find . -name "*.ttf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/TTF \;
}
