# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb2
conflicts=('mmdb')
pkgver=2.0.22
pkgrel=1
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)
sha256sums=('a9646933ce9f34633e1ae4901f2383af0e5318d6490851328f5b6aa06195ab51')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
