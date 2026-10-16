# Maintainer: SerShef <SerShef@users.noreply.github.com>
pkgname=beammp-launcher4linux
pkgver=2.8.1
pkgrel=1
pkgdesc='BeamMP Launcher for Linux, prebuilt (GamePath config/CLI override for non-Steam installs)'
arch=(x86_64)
url='https://github.com/SerShef/BeamMP-Launcher4Linux'
license=(AGPL-3.0-or-later)
depends=(glibc gcc-libs)
optdepends=('steam: launch BeamNG.drive through Steam')
provides=(beammp beammp-launcher)
conflicts=(beammp beammp-launcher beammp-launcher4linux-git beammp-launcher-git)

_srcbase="https://github.com/SerShef/BeamMP-Launcher4Linux/releases/download/v${pkgver}"
source=("${_srcbase}/BeamMP-Launcher"
        "${_srcbase}/BeamMP-Launcher.sha256")
sha256sums=(
  '3f1603a7d698bbca3f726ac52de2749c847f82c200c0f87493ad60fbbb872d2e'
  '34ea2effe56baf9e5e242001fe0e5ffbc852b1ed566b08c12b0f0e17df99e1a4'
)

package() {
  cd "$srcdir"
  install -Dm755 BeamMP-Launcher "$pkgdir/usr/lib/beammp/BeamMP-Launcher"
  install -Dm755 "$srcdir/beammp.sh" "$pkgdir/usr/bin/beammp"
  install -Dm644 "$srcdir/beammp.desktop" "$pkgdir/usr/share/applications/beammp.desktop"
}
