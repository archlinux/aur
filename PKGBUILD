# Maintainer:  Benjamin Davies <bentendavies at gmail dot com>

_pkgname=gol
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc="implementation of Conway's Game of Life in C"
url="https://github.com/Benjamin-Davies/$_pkgname"
arch=('i686' 'x86_64')
license=()
depends=()
makedepends=('git' 'pandoc')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git://github.com/Benjamin-Davies/$_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git rev-parse --short HEAD
}

prepare() {
  cd $_pkgname
  echo "No Prepare required"
}

build(){
  cd $_pkgname
  make all gol.1
}

package() {
  cd $_pkgname
  make PREFIX="$pkgdir/usr" install
}

