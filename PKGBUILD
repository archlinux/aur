# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf
pkgver=1.5.0
pkgrel=1
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
_gitname='OSM-binary'
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstreetmap/$_gitname/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$_gitname-$pkgver"
}

build() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

sha256sums=('2abf3126729793732c3380763999cc365e51bffda369a008213879a3cd90476c')
