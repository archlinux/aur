# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=ship162-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Decode and demodulate AIS data in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/ship162"
license=('MIT')
provides=('ship162')
conflicts=('ship162')

source_x86_64=("ship162-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("ship162-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('75e36d01de124c1d2ad0c9bcdd0a6d8095255716558cea315a91d36ce7d2cfeb')
sha256sums_aarch64=('cf88acc2418c04721007ad35abfa510cbcfb0cccab082c3f1dc289e9bc6d177f')

package() {
    cd "ship162-${CARCH}-unknown-linux-gnu"
    install -Dm755 "ship162" "${pkgdir}/usr/bin/ship162"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/ship162/readme.md"
}
