# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — display backlight listener. Watches
# `/sys/class/backlight/*/brightness` via inotify and fires an OSD on
# brightness change. Reads `wl_output.description` for friendly names.
#
# 0.1.5 and f3b8d0b21f7a4d8a0603083a478a04ec7c4da1dc975a1f4ffe609beb71573327 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-backlight-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="awob listener — display backlight → OSD."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-backlight')
conflicts=('awob-listener-backlight' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('f3b8d0b21f7a4d8a0603083a478a04ec7c4da1dc975a1f4ffe609beb71573327')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
