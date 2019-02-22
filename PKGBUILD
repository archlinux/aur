# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=prometheus-apcupsd-exporter-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Prometheus exporter that exposes metrics from apcupsd's NIS. (binary, not built from source)"
arch=('x86_64')
url="https://github.com/mdlayher/apcupsd_exporter"
license=('MIT')
depends=()
makedepends=()
source_x86_64=( 'prometheus-apcupsd-exporter.service'
"https://github.com/mdlayher/apcupsd_exporter/releases/download/${pkgver}/apcupsd_exporter")
sha256sums_x86_64=('c05ecf5014f33890cd07a8e41d9381008103ebcc8e49a506a161111bc4688f0c'
                   '217cfdfbd085657be5579b1cc691078fc5e2e6aaac4b3c72b45bbba05aba4b41')
package() {
    cd "${srcdir}"

    # Install Binary
    install -D -m0755 apcupsd_exporter "${pkgdir}/usr/bin/prometheus-apcupsd-exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-apcupsd-exporter.service"  "${pkgdir}/usr/lib/systemd/system/prometheus-apcupsd-exporter.service"
}
