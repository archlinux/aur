# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dslcad-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Programming language and interpreter for building 3D models"
arch=('x86_64')
url="https://github.com/DSchroer/dslcad"
license=('LGPL-2.1-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/DSchroer/dslcad/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/x86_64-unknown-linux-gnu.zip")
sha256sums=('f2f118b9029ec1871b953639ecc46651b2fc7b62e295e6cf3ef2ac4c9a058b33')
sha256sums_x86_64=('efcd59b4cd12e807b406de5909cefd8e28120c9f2a436fbcca96a3c713983dd5')

package() {
  install -Dm755 "dslcad" "${pkgdir}/usr/bin/dslcad"
  install -Dm755 "dslcad-viewer" "${pkgdir}/usr/bin/dslcad-viewer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
