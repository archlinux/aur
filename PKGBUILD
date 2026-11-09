# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=dabradio-bin
pkgver=0.5.2
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
sha256sums_x86_64=('364896facf1d00d88120da96022ac2727396da288539bb0e7168cf85b7ee1636')
sha256sums_aarch64=('ccf5f93593a1aeabc1a268679da3ef81af8f264a9f42966b7eb9b572218c3b51')

package() {
    cd "dabradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "dabradio" "${pkgdir}/usr/bin/dabradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/dabradio/readme.md"
}
