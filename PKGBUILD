# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=warpd-git
pkgver=r73.f7d1202
_gitname=warpd
pkgrel=1
pkgdesc="A small X program which facilitates recursively warping the pointer to different quadrants on the screen."
url="https://github.com/rvaiya/warpd"
license=('MIT')
arch=('x86_64')
md5sums=('SKIP')
makedepends=(git)
depends=(libxinerama libxft libxfixes libxtst libx11)
provides=(warpd)
source=("git+$url")

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${_gitname}
  make
}

package () {
  cd ${_gitname}
  make install
}
