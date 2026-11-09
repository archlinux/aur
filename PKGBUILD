# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=decode1090-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('decode1090')
conflicts=('decode1090')

source_x86_64=("decode1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/decode1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("decode1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/decode1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('87ed33e16d7abbe95cb72506a77008761428bb37f12eeee31edbf59900dbac57')
sha256sums_aarch64=('1da35528cafeb97ff5118cf6c863463b4bb7d4c49787fd4953b535f60866565e')

package() {
    cd "decode1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "decode1090" "${pkgdir}/usr/bin/decode1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/decode1090/readme.md"
}
