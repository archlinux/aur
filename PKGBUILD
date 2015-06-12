# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
# Contributor: Steve Anton <anxuiz.nx@gmail.com>
pkgname=libobj
pkgver=0.1
pkgrel=1
pkgdesc="A modern C++ library for parsing the Wavefront OBJ file format."
arch=(i686 x86_64)
url="http://people.cs.kuleuven.be/~ares.lagae/libobj/index.html"
license=('GPL')
depends=(gcc-libs)
makedepends=()
source=(http://people.cs.kuleuven.be/~ares.lagae/libobj/obj-$pkgver.tar.gz)
md5sums=('078f08cb2cd9b40dd8ff2e0c940f37fb')

build() {
  cd "$srcdir/obj-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/obj-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/lib/$pkgname.la"
}

# vim:set ts=2 sw=2 et:
