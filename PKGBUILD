# Maintainer: Oleg "KawaiDesu" Vasilev <mail@zeym.org>
pkgname=victoriametrics-bin
pkgver=1.149.0
pkgrel=1
pkgdesc="Fast, cost-effective and scalable time series database"
arch=('x86_64' 'aarch64')
url="https://victoriametrics.github.io"
license=('Apache-2.0')
provides=('victoriametrics')
conflicts=('victoriametrics')
backup=('etc/default/victoriametrics')
install=victoriametrics.install
source_x86_64=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}/victoria-metrics-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${pkgver}/victoria-metrics-linux-arm64-v${pkgver}.tar.gz")
source=("victoriametrics.service"
        "victoriametrics.default")
sha256sums=('6622e315f00bb78e21b5d9c3d6fe5bc447c7cedb1ab2de7a3a1d4c7e951270a7'
            '02ab7aa9ffca4962d35db5f02d93ebad318328e3ebca11a48e1ededfd59772b0')
sha256sums_x86_64=('6695fbee54bca58b78162ddf785c387b24641e57dfe4f3f743fb241f41dc3697')
sha256sums_aarch64=('4364b2dffe8f532c28bd427307d1609248696f25d837678bf86410059f5b9b85')

package(){
  install -Dm755 "${srcdir}/victoria-metrics-prod" "${pkgdir}/usr/bin/victoria-metrics"
  install -Dm644 "${srcdir}/victoriametrics.service" "${pkgdir}/usr/lib/systemd/system/victoriametrics.service"
  install -Dm644 "${srcdir}/victoriametrics.default" "${pkgdir}/etc/default/victoriametrics"
}
