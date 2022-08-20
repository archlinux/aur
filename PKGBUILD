# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=clzip
pkgver=1.13
pkgrel=2
pkgdesc="A C language version of lzip"
url="https://www.nongnu.org/lzip/clzip.html"
arch=('x86_64')
license=('GPL')
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('7b9943f3e971cb9cabadb3b0832c23984c9329cb48bbfa6fd0780146b6b3d612386b6ca8c6e688c05470e3e3474b688dfb3228ba6aff2093ea1d781eba5f2791'
              'SKIP')
validpgpkeys=('1D41C14B272A2219A739FA4F8FE99503132D7742') # Antonio Diaz Diaz

build() {
  cd "$pkgname-$pkgver"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
