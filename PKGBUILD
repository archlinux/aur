# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ganjnameh-fonts
pkgver=0.0.4
pkgrel=1
pkgdesc="Persian/Arabic display font"
url="https://github.com/font-store/GanjnamehFont"
arch=('any')
license=('OFL-1.1')
provides=('ganjnameh')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c5be11b3be867377c3366afb030b4b045293396f65768a8d66852c2a08516e59')

package() {
  cd "${srcdir}/GanjnamehFont-${pkgver}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
