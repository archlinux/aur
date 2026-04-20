# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=fmradio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="An FM radio demodulator and RDS decoder in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/desperado"
license=('MIT')
depends=('alsa-lib')
provides=('fmradio')
conflicts=('fmradio')

source_x86_64=("${url}/releases/download/v${pkgver}/fmradio-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/fmradio-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('285034c8c03d0095fb9343937348b90151ca00c012375808926c9884fc485b9a')
sha256sums_aarch64=('8042b6f03c235da099702829d88f4151a90fc81b3c314c8e7d2ba735ed9ebb3d')

package() {
    cd "fmradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "fmradio" "${pkgdir}/usr/bin/fmradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/fmradio/readme.md"
}
