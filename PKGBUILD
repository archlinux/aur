# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb2
conflicts=('mmdb')
pkgver=2.0.20
pkgrel=1
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)
sha256sums=('75f3ea5f3715f7fe36f43ca9e4de30d1d9ed33b759bbb311575ed875bf5c045f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
