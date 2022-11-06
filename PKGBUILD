# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=warpd-wayland
pkgver=v1.3.5
_gitname=warpd
pkgrel=1
pkgdesc="A modal keyboard driven interface for mouse manipulation."
license=('MIT')
arch=('x86_64')
makedepends=(git)
conflicts=(warpd-git warpd warpd-wayland-git)
depends=(wayland libxkbcommon cairo)
provides=(warpd)
source=(
  "${pkgname}.tar.gz::https://github.com/rvaiya/warpd/archive/refs/tags/${pkgver}.zip"
)

md5sums=('e55d892233a5bfedeab4b696a07cc431')

build () {
  cd "warpd-${pkgver/v/}"
  make
  make man
}

package () {
  cd "warpd-${pkgver/v/}"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
