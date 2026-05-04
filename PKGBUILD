# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — keyboard backlight listener. Watches
# `/sys/class/leds/*/brightness` via inotify and fires an OSD on
# keyboard-backlight change.
#
# 0.0.2 and f0871cf88eaddcfdf7649425a9ab3417990a8441b8cdb5f9b5dfed88fc4986c1 are filled in at publish time by the release
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
sha256sums=('f0871cf88eaddcfdf7649425a9ab3417990a8441b8cdb5f9b5dfed88fc4986c1')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-keyboard-backlight
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
