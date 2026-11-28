# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prometheus-rds-exporter-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Prometheus exporter for AWS RDS"
arch=('x86_64' 'aarch64')
url="https://github.com/qonto/prometheus-rds-exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/qonto/prometheus-rds-exporter/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prometheus-rds-exporter_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/prometheus-rds-exporter_Linux_arm64.tar.gz")
sha256sums=('42fe9b0c6fa7d8bb819be8c609ca693ccdacce8006ba2710928af48e1caefb6e')
sha256sums_x86_64=('f5d424c5f03968cec3b4628ba21fcacffc194929a189edb61a772e62a58f20a0')
sha256sums_aarch64=('9aedd778e563920eec8e68e42afd137ae70e45e5d1a3a67529be8a0584c605f4')

package() {
  install -Dm755 "prometheus-rds-exporter" "${pkgdir}/usr/bin/prometheus-rds-exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
