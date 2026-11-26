# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=farbod-fonts
pkgver=3.2.5
pkgrel=1
pkgdesc="Persian/Arabic font for text and print"
url="https://github.com/font-store/FarbodFont"
arch=('any')
license=('OFL-1.1')
provides=('farbod')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c86e0baed6f2e05d85083de27a80c0f885dfa2201705c83851692d0a31ebbef4')

package() {
  cd "${srcdir}/FarbodFont-${pkgver}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
