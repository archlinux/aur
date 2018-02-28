# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.0.1
pkgrel=1
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=('76560a0db99f494754fcbca979ed245b2bf4314d56445b749c83a3f8a481446c')

package() {
  pkgdesc="IBM Plex Mono, Sans, and Serif typefaces in truetype format"
  cd plex-${pkgver}
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -d "${pkgdir}"/usr/share/fonts/TTF
  find . -name "*.ttf" -exec install -Dm644 {} "${pkgdir}"/usr/share/fonts/TTF \;
}
