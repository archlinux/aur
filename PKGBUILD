# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noon-fonts
pkgver=0.9.0
pkgrel=1
pkgdesc="Persian/Arabic font designed for Quran text"
url="https://github.com/font-store/NoonFont"
arch=('any')
license=('OFL-1.1')
provides=('noon')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('36c192661a23cdea8598288b8a9bb6c9bc71b290329a207936d0c38ff5168406')

package() {
  cd "${srcdir}/NoonFont-${pkgver}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
