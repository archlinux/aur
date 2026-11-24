# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kplay-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Inspect messages in a Kafka topic from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/dhth/kplay"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kplay_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kplay_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('40b750f1dd2ebbfc887505e4394ee29e594488fb607c48c1910e2cddb79c4f11')
sha256sums_aarch64=('b754a0431056146a4dd0d5479caf3489121d7106460bde8a2904251cab5f7add')

package() {
  install -Dm755 "kplay" "${pkgdir}/usr/bin/kplay"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
