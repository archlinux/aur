# Maintainer: Angelo Fallaria <ba.fallaria+aur@gmail.com>
pkgname=victoriatraces-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Fast and easy to use database for traces that can handle terabytes of trace spans."
arch=('x86_64' 'aarch64')
url="https://docs.victoriametrics.com/victoriatraces/"
license=('Apache-2.0')
provides=('victoriatraces')
conflicts=('victoriatraces')
backup=('etc/default/victoriatraces')
install=victoriatraces.install
source_x86_64=("https://github.com/VictoriaMetrics/VictoriaTraces/releases/download/v${pkgver}/victoria-traces-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/VictoriaMetrics/VictoriaTraces/releases/download/v${pkgver}/victoria-traces-linux-arm64-v${pkgver}.tar.gz")
source=("victoriatraces.service"
        "victoriatraces.default")
sha256sums=('e6ff5cf2b202fc18cfcc127609765efd2255b8fbe32ef1732897fd8d72ad2fbc'
            '0fc91310e2c3140bd90b2fad62f497d8e7432cf3a2a8ab3a034b45958e01012a')
sha256sums_x86_64=('3089ead89b9a95369e265a5321b1ad8e670c3c94afbc9a9faaa9a356346b5b95')
sha256sums_aarch64=('18176f73fac3b9c7ea88ceba637c7f997593635e446e45e789dc68f1de6d0359')

package(){
  install -Dm755 "${srcdir}/victoria-traces-prod" "${pkgdir}/usr/bin/victoria-traces"
  install -Dm644 "${srcdir}/victoriatraces.service" "${pkgdir}/usr/lib/systemd/system/victoriatraces.service"
  install -Dm644 "${srcdir}/victoriatraces.default" "${pkgdir}/etc/default/victoriatraces"
}
