# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=decode1090-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('decode1090')
conflicts=('decode1090')

source_x86_64=("decode1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/decode1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("decode1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/decode1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1ae0f8e47db0840ce9106117ba8e31c3dd2d9775ca0caef0e26efaf6f54daf17')
sha256sums_aarch64=('953fb5ce3b8317d78e9127e81552e9f25b24ccc18d3ac53bb0979928fabb344d')

package() {
    cd "decode1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "decode1090" "${pkgdir}/usr/bin/decode1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/decode1090/readme.md"
}
