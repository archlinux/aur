# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=revsocks-bin
pkgver=2.9
pkgrel=1
pkgdesc="Reverse SOCKS5 implementation in Go"
arch=('x86_64')
url="https://github.com/kost/revsocks"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kost/revsocks/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/revsocks_linux_amd64")
sha256sums=('4b33334624bf4ea20b5fdea9f0fbdf92dab348a01d15969e88b85011677eca89')
sha256sums_x86_64=('9823c02067a4bdfc7b5d654d598390c41f14bd01dc1bd82c5dd6977023b14394')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/revsocks"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
