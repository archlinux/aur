# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=nlinline
pkgver=0.2.2
pkgrel=1
pkgdesc="A quick and clean API for NetLink networking configuring"
arch=('x86_64')
url="https://github.com/virtualsquare/nlinline"
license=('GPL2')
makedepends=('cmake' 'make' 'pandoc')

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('42d7d18ec31e07171e120bb71079d7ac96415f6231deb33fda9b87c57d7cd7db')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
