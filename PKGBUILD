# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — keyboard backlight listener. Watches
# `/sys/class/leds/*/brightness` via inotify and fires an OSD on
# keyboard-backlight change.
#
# 0.0.2 and bbfb40d27b36496546b36d4bc4bfcc2450c11f7b61223c39a1c59848eebe9608 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-keyboard-backlight-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="awob listener — keyboard backlight → OSD."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-keyboard-backlight')
conflicts=('awob-listener-keyboard-backlight' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('bbfb40d27b36496546b36d4bc4bfcc2450c11f7b61223c39a1c59848eebe9608')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-keyboard-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
