# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=ship162-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Decode and demodulate AIS data in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/ship162"
license=('MIT')
provides=('ship162')
conflicts=('ship162')

source_x86_64=("${url}/releases/download/v${pkgver}/ship162-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/ship162-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2e08b587daa40aed36ba742446fab41b3fe8c1230c17c6eeba36ef43aaf5d805')
sha256sums_aarch64=('03a24a3ac71bb31ef317a02ba0c5acfe3f6b2e4333293bc8f6b3e1982bab4d0e')

package() {
    cd "ship162-${CARCH}-unknown-linux-gnu"
    install -Dm755 "ship162" "${pkgdir}/usr/bin/ship162"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/ship162/readme.md"
}
