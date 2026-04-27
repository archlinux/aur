# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=decode1090-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('decode1090')
conflicts=('decode1090')

source_x86_64=("${url}/releases/download/v${pkgver}/decode1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/decode1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('437b37d1cff7fa179811544b3bafe4c66b5c6aeb1ba4515bd9e1558383ae6f68')
sha256sums_aarch64=('751d69d084559269706aac07432a8d1a364b53d0cb2658fe5cea665789eebc5d')

package() {
    cd "decode1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "decode1090" "${pkgdir}/usr/bin/decode1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/decode1090/readme.md"
}
