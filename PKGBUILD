# Maintainer: Oleg "KawaiDesu" Vasilev <mail@zeym.org>
pkgname=victoriametrics-bin
pkgver=1.130.0
pkgrel=3
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
            '0fc91310e2c3140bd90b2fad62f497d8e7432cf3a2a8ab3a034b45958e01012a')
sha256sums_x86_64=('8562de8a8fb1b2e912b78e1bac9468060ff9be3367a80e6dcc1fe667cfe7a8ac')
sha256sums_aarch64=('e210a0f345f71ab11a588f5e05ac90c67fa2047b974fd17409d9b787c3e1bc6b')

package(){
  install -Dm755 "${srcdir}/victoria-metrics-prod" "${pkgdir}/usr/bin/victoria-metrics"
  install -Dm640 "${srcdir}/victoriametrics.service" "${pkgdir}/usr/lib/systemd/system/victoriametrics.service"
  install -Dm640 "${srcdir}/victoriametrics.default" "${pkgdir}/etc/default/victoriametrics"
}
