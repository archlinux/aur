# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb2
conflicts=('mmdb')
pkgver=2.0.12
pkgrel=2
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/dependencies/$pkgname-$pkgver.tar.gz)
sha256sums=('a24fca06266c6b4db06ad1e0e0ddf5037f2ea624347ab119a6b163d8929c62a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  cp $srcdir/$pkgname-$pkgver/${pkgname}/lib${pkgname}.la $pkgdir/usr/lib/
}
