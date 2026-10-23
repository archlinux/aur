# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=fmradio-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="An FM radio demodulator and RDS decoder in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/desperado"
license=('MIT')
depends=('alsa-lib')
provides=('fmradio')
conflicts=('fmradio')

source_x86_64=("fmradio-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/fmradio-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("fmradio-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::${url}/releases/download/v${pkgver}/fmradio-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('70ac5e0d65e7c370dc41916c5435b2d73e5b86ebbb5b5e463e21f69ae483caa6')
sha256sums_aarch64=('889163adad15040d78d5cf4a433d7a99c6822b46560b2111780a459eda33d2f5')

package() {
    cd "fmradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "fmradio" "${pkgdir}/usr/bin/fmradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/fmradio/readme.md"
}
