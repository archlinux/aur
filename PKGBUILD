# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=jet1090-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('jet1090')
conflicts=('jet1090')

source_x86_64=("jet1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("jet1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('98d175f458807848c4f9959e408f46efacfe573b1dd8c02130519534afb53e9d')
sha256sums_aarch64=('75b6652ddae3abbe2bcb5dd96c5f13c7fae14339aa17d021239c39fe4df6bf3e')

package() {
    cd "jet1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "jet1090" "${pkgdir}/usr/bin/jet1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/jet1090/readme.md"
}
