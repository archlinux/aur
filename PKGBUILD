# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=jet1090-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Decode and demodulate Mode S and ADS-B in Rust/Python"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/jet1090"
license=('MIT')
provides=('jet1090')
conflicts=('jet1090')

source_x86_64=("jet1090-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("jet1090-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/jet1090-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('639819205fc50c9824ca792e120c5ace469e689dd88bfce52526a54ec89c10d2')
sha256sums_aarch64=('5eed2bd69dfdb53a868bd420f0330ef44192478c29d53f27c72b62f45ece08b2')

package() {
    cd "jet1090-${CARCH}-unknown-linux-gnu"
    install -Dm755 "jet1090" "${pkgdir}/usr/bin/jet1090"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/jet1090/readme.md"
}
