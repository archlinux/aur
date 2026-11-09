# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=fmradio-bin
pkgver=0.5.2
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
sha256sums_x86_64=('605698a1b54138e0c1af4379a4cc63da988298ffbbbdc4a89313be5cb0d9b6b8')
sha256sums_aarch64=('8982173607589a1731ba04fe36ec55a2c0da36024334dde4fa0d6f022fa54f52')

package() {
    cd "fmradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "fmradio" "${pkgdir}/usr/bin/fmradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/fmradio/readme.md"
}
