# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=broadlinkac2mqtt-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Control Broadlink air conditioners from Home Assistant via MQTT"
arch=('x86_64' 'aarch64')
url="https://github.com/ArtemVladimirov/broadlinkac2mqtt"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/broadlinkac2mqtt-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/broadlinkac2mqtt-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('dd683e74b20967091508ccb90cc179bd9d6cf19a1feb48989f3e10f5ec110f4a')
sha256sums_aarch64=('5bef50485bd857df2dd70247b7cef1e852a4e0e74ad8390e4deb750364bb6bf9')

package() {
  install -Dm755 "broadlinkac2mqtt" "${pkgdir}/usr/bin/broadlinkac2mqtt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
