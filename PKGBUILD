# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pg_exporter-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="PostgreSQL and PgBouncer metrics exporter for Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/pgsty/pg_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pg_exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pg_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('e8fdf64c352081720a53420a2c7ea095654078d5fab5f6213786bb6476791fdf')
sha256sums_aarch64=('91da5400ae31d42925af721c7d5f8eb0befcbb104d8a14ae5f08707abb5e333b')

package() {
  install -Dm755 "pg_exporter" "${pkgdir}/usr/bin/pg_exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
