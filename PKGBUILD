# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noah-mqtt-bin
pkgver=0.0.29
pkgrel=1
pkgdesc="Integrate Growatt Noah 2000 batteries with Home Assistant via MQTT"
arch=('x86_64' 'aarch64')
url="https://github.com/mtrossbach/noah-mqtt"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/noah-mqtt_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/noah-mqtt_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6664ec998600ddd708524377e16336587625f9ec0f7a44f721ef0da542797287')
sha256sums_aarch64=('b9b45948dc9d63711c3a3b32a38b12643e5b077dd935c72d62657ed4939ff30c')

package() {
  install -Dm755 "noah-mqtt" "${pkgdir}/usr/bin/noah-mqtt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
