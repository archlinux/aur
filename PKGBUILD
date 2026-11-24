# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-file-viewer-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Git-aware read-only file viewer for herdr"
arch=('x86_64')
url="https://github.com/smarzban/herdr-file-viewer"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/smarzban/herdr-file-viewer/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/herdr-file-viewer-x86_64-unknown-linux-musl")
sha256sums=('bd3074a1f3334de588ab22f748cbe5976faab1f66fdac58dd8e964c9f4a5a79a')
sha256sums_x86_64=('d87efee98e07f65daf3162d30c8cc5a5efeb6a8c992b7a9933a7cf5367e33186')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr-file-viewer"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
