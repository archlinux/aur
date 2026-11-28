# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clickhouse-flamegraph-bin
pkgver=2025.0.1
pkgrel=1
pkgdesc="Build flamegraphs from ClickHouse system.trace_log"
arch=('x86_64' 'aarch64')
url="https://github.com/Slach/clickhouse-flamegraph"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clickhouse-flamegraph_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clickhouse-flamegraph_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fa8be0155f4db5cea5db162f8a1cc3011ae6ea3646e217609a14cf0201ceea14')
sha256sums_aarch64=('251aff0243115e01064722f6a6e01a79dbc9c546cfa3a1959f71153c307f3881')

package() {
  install -Dm755 "clickhouse-flamegraph" "${pkgdir}/usr/bin/clickhouse-flamegraph"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
