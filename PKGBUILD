# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=dabradio-bin
pkgver=0.5.1
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
sha256sums_x86_64=('bfa81e97fcf7b9afd266f3f58b242d6d4a5cdc14edb193ae4eace3005af76b70')
sha256sums_aarch64=('4f57c2dfc69ae0aabad00b1acaeb362a8eb44d3e9406f9b0241b44777bc165c1')

package() {
    cd "dabradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "dabradio" "${pkgdir}/usr/bin/dabradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/dabradio/readme.md"
}
