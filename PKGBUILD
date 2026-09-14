# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — keyboard backlight listener. Watches
# `/sys/class/leds/*/brightness` via inotify and fires an OSD on
# keyboard-backlight change.
#
# 0.1.8 and 0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-keyboard-backlight-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="awob listener: keyboard backlight"
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-keyboard-backlight')
conflicts=('awob-listener-keyboard-backlight' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-keyboard-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
