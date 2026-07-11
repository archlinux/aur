# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — display backlight listener. Watches
# `/sys/class/backlight/*/brightness` via inotify and fires an OSD on
# brightness change. Reads `wl_output.description` for friendly names.
#
# 0.1.7 and e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-backlight-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="awob listener: screen brightness"
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-backlight')
conflicts=('awob-listener-backlight' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e23b2b772c8c3ff7fe6680be1245fa6af2c74ad22227c95cdcfa90b950c36ee2')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
