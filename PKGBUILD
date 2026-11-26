# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nika-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="Persian/Arabic font for text and print"
url="https://github.com/font-store/NikaFont"
arch=('any')
license=('OFL-1.1')
provides=('nika')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9dc3241f0702e7dd22dcdd00ebd21357147d488dfd7914808e12f9a842800138')

package() {
  cd "${srcdir}/NikaFont-${pkgver}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
