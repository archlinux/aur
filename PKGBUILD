# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR binary package — PipeWire volume / mute listener. Subscribes to
# the PipeWire graph and fires an OSD on every audio-node volume or
# mute change.
#
# Pulls the same release tarball as awob-bin and installs the single
# listener binary. 0.1.2 and 8f344b5f63c15e1c826375317ad83f42f8da5d5742e910750fe779b595a41ca5 are filled in at publish
# time by the release workflow.

pkgname=awob-listener-pipewire-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="awob listener — PipeWire volume / mute → OSD."
arch=('x86_64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('awob-bin' 'pipewire')
provides=('awob-listener-pipewire')
conflicts=('awob-listener-pipewire' 'awob-git')
source=("awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jmylchreest/awob/releases/download/v${pkgver}/awob-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8f344b5f63c15e1c826375317ad83f42f8da5d5742e910750fe779b595a41ca5')

package() {
    cd "awob-${pkgver}-x86_64-unknown-linux-gnu"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/awob-listener-pipewire
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
