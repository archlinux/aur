# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — PipeWire volume / mute listener. Subscribes to
# the PipeWire graph and fires an OSD on every audio-node volume or
# mute change.
#
# Pulls the same release tarball as awob-bin and installs the single
# listener binary. 0.1.8 and 0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223 are filled in at publish
# time by the release workflow.

pkgname=awob-listener-pipewire-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="awob listener: pipewire volume"
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin' 'pipewire')
provides=('awob-listener-pipewire')
conflicts=('awob-listener-pipewire' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0dd8459642e318cbd6e1c6aaafd5b9622604e1e68d80770aa7a69432ca0a4223')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-pipewire
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
