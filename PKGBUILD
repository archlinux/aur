# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — battery / AC state listener. Watches every
# `/sys/class/power_supply/*` battery via udev `power_supply` uevents
# and fires an OSD on capacity / state change.
#
# 0.1.6 and 14bce4bc40bebfa61c8151b06716350686b38762a135c9b05c41a4d809572f50 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-battery-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="awob listener — battery + AC state → OSD."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
# libudev.so is the canonical AUR provider key for systemd-libs's
# udev runtime — same string the wider AUR uses (e.g. acpid, vbo*).
depends=('awob-bin' 'libudev.so')
provides=('awob-listener-battery')
conflicts=('awob-listener-battery' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('14bce4bc40bebfa61c8151b06716350686b38762a135c9b05c41a4d809572f50')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-battery
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
