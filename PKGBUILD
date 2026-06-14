# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=datalink-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Decode aviation datalink traffic from payloads, SDR, files, and Airframes.io"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/datalink"
license=('MIT')
provides=('datalink')
conflicts=('datalink')

source_x86_64=("datalink-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/datalink-v${pkgver}/datalink-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("datalink-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/datalink-v${pkgver}/datalink-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('815f6f58748c5a2f0d6dc18b982bd4577de258104a1ebd537019329480bced37')
sha256sums_aarch64=('9b8164e72800de4611fa0e41ef02cc207d23adf82456cd3b57f3f1c7c609cc3e')

package() {
    cd "datalink-${CARCH}-unknown-linux-gnu"
    install -Dm755 "datalink" "${pkgdir}/usr/bin/datalink"
}
