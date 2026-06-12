# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=decode1090-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('decode1090')
conflicts=('decode1090')

source_x86_64=("${url}/releases/download/v${pkgver}/decode1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/decode1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('077a62c901735fae7a703cdae57e2c2306d941d7e7687420b7ec8e56ac740cb5')
sha256sums_aarch64=('07ac29aa93dbfdf33c5c1954f068c9d9544274c75d421d367cdcb7e3590384fb')

package() {
    cd "decode1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "decode1090" "${pkgdir}/usr/bin/decode1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/decode1090/readme.md"
}
