# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=lsuio
pkgver=0.2.0
pkgrel=1
pkgdesc="List UIO devices"
arch=('x86_64')
url="https://www.osadl.org/UIO-Archives.uio-archives.0.html"
license=('GPL2')
source=("https://www.osadl.org/uploads/media/$pkgname-$pkgver.tar.gz")
sha256sums=('c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
