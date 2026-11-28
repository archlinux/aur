# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mc-monitor-bin
pkgver=1.21.1
pkgrel=1
pkgdesc="Monitor Minecraft server status with Prometheus and InfluxDB output"
arch=('x86_64' 'aarch64')
url="https://github.com/itzg/mc-monitor"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mc-monitor_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mc-monitor_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c91093330daa4312443255976b5e913e9706d1bfde95d8f209cfa34a89a9f0e9')
sha256sums_aarch64=('6c3185be1ccd2c0750d85aff716725946c0c13512e1895eca5d066d4921b9649')

package() {
  install -Dm755 "mc-monitor" "${pkgdir}/usr/bin/mc-monitor"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
