# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vizhehazad-fonts
pkgver=0.0.3
pkgrel=1
_commit=e82a39ff57f8fcc714c8d924893fd342ed8234b2
pkgdesc="Persian/Arabic display font"
url="https://github.com/font-store/font-VizhehAzad"
arch=('any')
license=('OFL-1.1')
provides=('vizhehazad')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('270fb0af7382c9678bcfa8abaab96df9a5017343b6829942a4ba69628ae7b1a5')

package() {
  cd "${srcdir}/font-VizhehAzad-${_commit}"

  find dist -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find dist -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
