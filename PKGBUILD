# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=lichii-shader-sync-bin
pkgver=1.2.1
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
sha256sums=('9f5a9728a3e80d3397087477a169a80d96d2bfc398eea2b92cb11d3b8f52a69b')

package() {
  install -Dm755 "lichii-sync-${pkgver}" "$pkgdir/usr/bin/lichii-sync"
}
