# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prometheus-nats-exporter-bin
pkgver=0.20.3
pkgrel=1
pkgdesc="Prometheus exporter for NATS metrics"
arch=('x86_64' 'aarch64')
url="https://github.com/nats-io/prometheus-nats-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/prometheus-nats-exporter-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/prometheus-nats-exporter-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('be2eab36ebc5f57fdd9ad1c61d4022f4fa436d6339336bea8d5b7587b879bb47')
sha256sums_aarch64=('7d82dc00a7eb1b14ea7f18ab917dcc350a45dda60ff3af877264aee7b721db58')

package() {
  install -Dm755 "prometheus-nats-exporter" "${pkgdir}/usr/bin/prometheus-nats-exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
