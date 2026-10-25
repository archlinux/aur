# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=ship162-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Decode and demodulate AIS data in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/ship162"
license=('MIT')
provides=('ship162')
conflicts=('ship162')

source_x86_64=("ship162-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("ship162-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/ship162-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('3ede10cc4edf8c281571a07130c34cc73050deabcc54b503e27dcb853b1ebde7')
sha256sums_aarch64=('f315db89f1bf1bfbab4fe4b6588bf948c0d0f04a459dc2a9c0b68e72fb64c5b8')

package() {
    cd "ship162-${CARCH}-unknown-linux-gnu"
    install -Dm755 "ship162" "${pkgdir}/usr/bin/ship162"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/ship162/readme.md"
}
