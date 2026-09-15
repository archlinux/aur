# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=fmradio-bin
pkgver=0.5.0
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
sha256sums_x86_64=('0c64f722b7ed20598e20a36ea9fdab85ba748ac5a53e5f3281a1b9911ed62274')
sha256sums_aarch64=('8c4f99502e42518b9d756cafdd41a25571a15ffb65df797d2f1f6fa8e3eaa0a7')

package() {
    cd "fmradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "fmradio" "${pkgdir}/usr/bin/fmradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/fmradio/readme.md"
}
