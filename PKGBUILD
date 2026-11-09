# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=jet1090-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('jet1090')
conflicts=('jet1090')

source_x86_64=("jet1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("jet1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('0fca6224f138e34716dee03028f630771d8e17c9d63670c64a0e0fd5ac2d7429')
sha256sums_aarch64=('1e3af5cb4af4606e969968941787abfc4adff9d175d6fdbfb1f9c4f6aa1e102d')

package() {
    cd "jet1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "jet1090" "${pkgdir}/usr/bin/jet1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/jet1090/readme.md"
}
