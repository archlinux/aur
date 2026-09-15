# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=dabradio-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A DAB/DAB+ digital radio decoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/desperado"
license=('MIT')
depends=('alsa-lib')
provides=('dabradio')
conflicts=('dabradio')

source_x86_64=("dabradio-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/dabradio-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("dabradio-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/dabradio-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('fbad5149025fc24afbdede242ed75701388596e9c4cfa24afe0fe9f2d5ff61ca')
sha256sums_aarch64=('1aad1ea02670fcdc9a4249f08cb7a6c261397e84c2885ea7faad05fb6341984d')

package() {
    cd "dabradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "dabradio" "${pkgdir}/usr/bin/dabradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/dabradio/readme.md"
}
