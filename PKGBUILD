# Maintainer: Valentin Elovskiy <evvsoft@gmail.com>

pkgname=prometheus-redis-exporter-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Prometheus exporter for Redis (binary)"
arch=('x86_64')
url="https://github.com/oliver006/redis_exporter"
license=('MIT')
depends=('glibc')
provides=('prometheus-redis-exporter')
conflicts=('prometheus-redis-exporter')
source=("https://github.com/oliver006/redis_exporter/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-amd64.tar.gz"
        "prometheus-redis-exporter.service")
sha256sums=('799fa6c73129490a66bff8fe21cb60a8dee204dc67bacff89b2dd3994f1e8dde'
            'f48565cf25f3ca8b120b5ad0cef9689d96d1fec22a7dd82e8de78ec23de3dad1')

package() {
  cd "${srcdir}/redis_exporter-v${pkgver}.linux-amd64"

  install -Dm755 "redis_exporter" "${pkgdir}/usr/bin/prometheus_redis_exporter"
  install -Dm644 "${srcdir}/prometheus-redis-exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/prometheus-redis-exporter.service"
}
