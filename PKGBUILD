# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=jet1090-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('jet1090')
conflicts=('jet1090')

source_x86_64=("${url}/releases/download/v${pkgver}/jet1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/jet1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('af225a87dce70e5f66fb6443bbfbd89f32c254e567a41a5ca9f3595b4cd6f54f')
sha256sums_aarch64=('10dc9bf3b467ff5a8dc2ca9d8517291494b7e615cae26efd1bdc821bfc6851c7')

package() {
    cd "jet1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "jet1090" "${pkgdir}/usr/bin/jet1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/jet1090/readme.md"
}
