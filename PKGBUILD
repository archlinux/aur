# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=dabradio-bin
pkgver=0.4.2
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
sha256sums_x86_64=('ca224a2c762934a26555ad354ea83c8ec2163c45cb2adb65663da8f8d4a6f66c')
sha256sums_aarch64=('767e9d41adb218b7b807945b3a769b2322447aec4f1ee6d41c8fbf5ea669ac43')

package() {
    cd "dabradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "dabradio" "${pkgdir}/usr/bin/dabradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/dabradio/readme.md"
}
