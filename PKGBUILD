# Maintainer: lynix <lynix47@gmail.com>

pkgname=graphite-exporter-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Exporter for metrics received via Graphite protocol"
url="https://github.com/prometheus/graphite_exporter"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
depends=('glibc' 'systemd')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=('etc/conf.d/graphite-exporter')
source=('graphite-exporter.service' 'graphite-exporter.conf')
source_x86_64=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-386.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/graphite_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums=('26f1500e903befb08a8c14d509c82975f14d979f6b5fa9d748fe0208c21efa76' \
            '67956be5b5c675e8a3b5fb488c66c5627ba9b8bc19371be08e921c369ca66f6f')
sha256sums_x86_64=('6b5df84a35aba0674f262295d907ca864f08d1a50788f7755339169621b9f144')
sha256sums_i686=('1e9b8f02ab4f2124572f4a32d37b443f93f2c6b28c8392562086d2d1a2450f50')
sha256sums_arm=('6acaff8037943c1165b624efc3aba1184ef3a25d35e670c0501b9170e647e6eb')
sha256sums_armv6h=('10a8f15a81b58006618349d80802a0f01baad2f559dda9ee040558d3d43df2e0')
sha256sums_armv7h=('81722a15d9621a6fc25e236111931887f90b38b30b00eb1baec4ff50c713ba5d')
sha256sums_aarch64=('8c12d8a615b6c2ee43492e1e86fe36c0e4d835ca5b19b8d37b51d8e35cbd7c76')

package() {
    install -Dm755 "graphite_exporter-${pkgver}.linux-"*/graphite_exporter \
        -t "${pkgdir}/usr/bin"
    install -Dm644 graphite-exporter.service \
        -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 graphite-exporter.conf \
        "${pkgdir}/etc/conf.d/graphite-exporter"
}

# vim:set ts=4 sw=4 et:
