# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf
pkgver=1.4.0
pkgrel=1
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
_gitname='OSM-binary'
source=("$pkgname-$pkgver.tar.gz::https://github.com/scrosby/$_gitname/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

sha256sums=('be634444d10ad23c127946e0aa7a44bd2d975fc89f53fc022e7504221fbc2cae')
