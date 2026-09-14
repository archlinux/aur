# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — display backlight listener. Watches
# `/sys/class/backlight/*/brightness` via inotify and fires an OSD on
# brightness change. Reads `wl_output.description` for friendly names.
#
# 0.1.8 and 0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-backlight-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="awob listener: screen brightness"
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-backlight')
conflicts=('awob-listener-backlight' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
