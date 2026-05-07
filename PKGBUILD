# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — wob-protocol FIFO bridge. Reads numeric values
# (and optional " <bg>" / " <bg> <border>" suffixes) from a named pipe
# and fires an OSD per line. Drop-in for existing wob keybinds.
#
# 0.1.6 and 14bce4bc40bebfa61c8151b06716350686b38762a135c9b05c41a4d809572f50 are filled in at publish time by the release
# workflow.

pkgname=awob-listener-wob-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="awob listener — wob-protocol FIFO bridge."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin')
provides=('awob-listener-wob')
conflicts=('awob-listener-wob' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('14bce4bc40bebfa61c8151b06716350686b38762a135c9b05c41a4d809572f50')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-wob
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
