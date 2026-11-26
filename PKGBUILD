# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grafana-kiosk-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="Kiosk utility for Grafana"
arch=('x86_64' 'aarch64')
url="https://github.com/grafana/grafana-kiosk"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/grafana/grafana-kiosk/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/grafana-kiosk.linux.amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/grafana-kiosk.linux.arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('b0a88bcce27765cad951e030c076451e64f0958b591214deb39f690e153e68dc')
sha256sums_aarch64=('a0103bc72caf84131ea6bdca03b4fed6c33c7de14ccf923355b3e77391f7cb3a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/grafana-kiosk"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
