# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf
pkgver=1.3.3
pkgrel=1
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
_gitname='OSM-binary'
source=("https://github.com/scrosby/$_gitname/archive/v$pkgver.zip")

build() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
sha1sums=('f3bd43f95df887dd6f6824735b4d5b8776279115')
md5sums=('ae2aed6948a09b6b5f1482255030b863')
