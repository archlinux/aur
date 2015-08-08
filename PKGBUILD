# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=flash-screen-git
_gitname=flash-screen
pkgver=0.r0.gb95ca6e
pkgrel=1
pkgdesc="Flashes the screen and emits a shutter sound"
arch=(i686 x86_64)
url="https://github.com/eigengrau/flash-screen"
license=(GPL)
depends=(gtk3 libcanberra)
makedepends=(git)
provides=(flash-screen)
conflicts=(flash-screen)
source=(git+https://github.com/eigengrau/flash-screen)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  make PREFIX=usr DESTDIR="$pkgdir" install
}
