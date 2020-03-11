# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=new-ospgl-git
_pkgname=new-ospgl
pkgver=1
pkgrel=1
epoch=1
pkgdesc="Open Space Program"
url="https://www.openspaceprogram.org/"
arch=(x86_64)
license=(GPL2)
makedepends=(cmake make gcc)
provides=(new-ospgl)
source=("git+https://github.com/TheOpenSpaceProgram/new-ospgl.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  mkdir build
  cd build
  cmake ../$_pkgname
  make
}

package() {
  DESTDIR="$pkgdir" make install
}
