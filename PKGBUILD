# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmpbf-git
pkgver=1.3.3.r15.g1283c4a
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="A library to support OpenStreetMap's protocolbuffer binary format (OSM PBF)"
arch=('i686' 'x86_64')
url="https://github.com/scrosby/OSM-binary"
license=('LGPL3')
depends=('protobuf')
makedepends=('git')
provides=('libosmpbf')
source=("$pkgname::git+https://github.com/scrosby/OSM-binary.git")
md5sums=('SKIP')

build() {
  cd "$pkgname/src"
  make
}

package() {
  cd "$pkgname/src"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
