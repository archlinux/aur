# Maintainer: lynix <lynix47@gmail.com>

pkgname=graphite-exporter-bin
pkgver=0.9.0
pkgrel=2
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
sha256sums_x86_64=('8da5bf07180f345abbd0e3c5ddf0f2bd319d930b6f9dd0385f4cfebdc6815c86')
sha256sums_i686=('34b4bf4fd65f17b1cd3a2ab3802dac70a02814a32b840d7724e62a2d0c83697e')
sha256sums_arm=('a674e9aca196ecb97c9f38baac3a4a87eca55190c46e074703d2553137b0346d')
sha256sums_armv6h=('7736600eb3c8f013b61802b9bc52af64558365cd86833764682bb1aec20ad0d9')
sha256sums_armv7h=('4c4f411e224840ce86f553abc26d569b57b492ea3a901796e25aa7ea38cb0ebc')
sha256sums_aarch64=('3d45c0123d5108ba92e5a674f11e3c2bd8c4e9dbd0fd4d6921e8fc033088743a')

package() {
    install -Dm755 "graphite_exporter-${pkgver}.linux-"*/graphite_exporter \
        -t "${pkgdir}/usr/bin"
    install -Dm644 graphite-exporter.service \
        -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 graphite-exporter.conf \
        "${pkgdir}/etc/conf.d/graphite-exporter"
}

# vim:set ts=4 sw=4 et:
