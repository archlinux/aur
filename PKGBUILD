# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lalmax-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Streaming media server with SRT, WebRTC, WHIP/WHEP, HLS and GB28181"
arch=('x86_64' 'aarch64')
url="https://github.com/q191201771/lalmax"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/q191201771/lalmax/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lalmax-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lalmax-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('37ef0fa1df7926353747ba43dd3d59fac502f1f8fe1a68c0eb9429afb5a6b8fc')
sha256sums_x86_64=('10f4cd79606ef86ccdff2c4ffc9021d22e71ab65ebe5cbaa66437687f183d150')
sha256sums_aarch64=('c2f8b15de7e8d67efcff557b40e8e82da788017fe2019b0650e4d19856d2e1e7')

package() {
  install -Dm755 "lalmax" "${pkgdir}/usr/bin/lalmax"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
