# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lichii-shader-sync-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Downloads shared Vulkan shader caches into Lichii and Eden, so games stutter less on first play (upstream binary)"
arch=('x86_64')
url="https://github.com/oceanpacificpeace/lichii-shader-sync"
# upstream has no licence file
license=('unknown')
# the binary is static; pgrep: it refuses to sync while Lichii is running
depends=('procps-ng')
provides=('lichii-shader-sync')
conflicts=('lichii-shader-sync')
options=('!strip' '!debug')
source=("lichii-sync-${pkgver}::${url}/releases/download/v${pkgver}/lichii-sync-linux-amd64")
sha256sums=('fd37dc83a2d74fa02bb96afc5e8cc57f8e05157a3073a3f1f1e79fd3c2d1aeae')

package() {
  install -Dm755 "lichii-sync-${pkgver}" "$pkgdir/usr/bin/lichii-sync"
}
