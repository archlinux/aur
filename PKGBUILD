# Maintainer: SerShef <SerShef@users.noreply.github.com>
pkgname=beammp-launcher4linux
pkgver=2.8.1
pkgrel=4
pkgdesc='BeamMP Launcher for Linux, (GamePath override for non-Steam installs, launcher port passed to game), prebuilt vcpkg included (no dependency).'
arch=(x86_64)
url='https://github.com/SerShef/BeamMP-Launcher4Linux'
# Original upstream project also at: https://github.com/BeamMP/BeamMP-Launcher
license=(AGPL-3.0-or-later)
depends=(glibc gcc-libs)
optdepends=('steam: launch BeamNG.drive through Steam')
provides=(beammp beammp-launcher)
conflicts=(beammp beammp-launcher beammp-launcher4linux-git beammp-launcher-git)

_srcbase="https://github.com/SerShef/BeamMP-Launcher4Linux/releases/download/v${pkgver}"
source=("${_srcbase}/BeamMP-Launcher"
        "beammp.sh"
        "beammp.desktop")
sha256sums=(
  'a26b5f5055497d84d0a83aecbe02b76fc49f6f88317961502adac751bb96ce25'
  '44f6abc02214a249d32ecea8fb62f308885ce24516427877badd10f3284442af'
  '616f8bbeca9e62cbb95b6785dd7b95f5afcb190c819ef9b6ac7ca1bc5c9c3df3'
)
package() {
  cd "$srcdir"
  install -Dm755 BeamMP-Launcher "$pkgdir/usr/lib/beammp/BeamMP-Launcher"
  install -Dm755 "$srcdir/beammp.sh" "$pkgdir/usr/bin/beammp"
  install -Dm644 "$srcdir/beammp.desktop" "$pkgdir/usr/share/applications/beammp.desktop"
}
