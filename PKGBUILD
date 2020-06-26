# Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=prometheus-systemd-exporter
pkgver=0.4.0
pkgrel=0

pkgdesc='Prometheus exporter for systemd units, written in Go.'
url='https://github.com/povilasv/systemd_exporter'
arch=('x86_64')
license=('Apache')

source=("$pkgname-$pkgver.tar.gz::https://github.com/povilasv/systemd_exporter/releases/download/v$pkgver/systemd_exporter-$pkgver.linux-amd64.tar.gz"
  prometheus-systemd-exporter.service
)

sha256sums=(
  'e417e279c55789e7c0bd6dc68643ae164dc819425116e84c8a7e0c5a316cae03'
  'c821d8a3a93241c6ee9b2dd8d3cc0ab0c3e6e23159bed7dc43ca7b84a9b8119b'
)

package () {
  install -Dm644 prometheus-systemd-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-systemd-exporter.service

  cd "$srcdir"/systemd_exporter-$pkgver.linux-amd64
  install -Dm755 systemd_exporter "$pkgdir"/usr/bin/$pkgname
}
