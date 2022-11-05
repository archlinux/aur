# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=warpd
pkgver=v1.3.5
_gitname=warpd
pkgrel=1
pkgdesc="A modal keyboard driven interface for mouse manipulation."
license=('MIT')
arch=('x86_64')
makedepends=(git)
depends=(libxinerama libxft libxfixes libxtst libx11 libxkbcommon cairo)
optdepends=('wayland: wayland support')
conflicts=(warpd-git warpd-wayland warpd-wayland-git)
provides=(warpd)
source=(
  "${pkgname}.tar.gz::https://github.com/rvaiya/warpd/archive/refs/tags/${pkgver}.zip"
)

md5sums=('e55d892233a5bfedeab4b696a07cc431')

build () {
  cd "${pkgname}-${pkgver/v/}"
  make
  make man
}

package () {
  cd "${pkgname}-${pkgver/v/}"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
