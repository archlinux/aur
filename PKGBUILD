# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clickhouse_sinker-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Load data from Kafka into ClickHouse"
arch=('x86_64' 'aarch64')
url="https://github.com/housepower/clickhouse_sinker"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clickhouse_sinker_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clickhouse_sinker_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('8f5f1f2f2e690fdcc7456e9a0eedf71df338173bd5625c72a9277701d155b452')
sha256sums_aarch64=('394e635afdf5adf0712411203d5f4899f20164a2dd2645078f531d914a578407')

package() {
  install -Dm755 "nacos_publish_config" "${pkgdir}/usr/bin/nacos_publish_config"
  install -Dm755 "clickhouse_sinker" "${pkgdir}/usr/bin/clickhouse_sinker"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
