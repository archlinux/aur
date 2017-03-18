# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=c-graph
pkgver=2.0
pkgrel=1
pkgdesc="Demonstrates the theory of convolution underlying engineering systems and signal analysis. "
url="https://www.gnu.org/software/c-graph/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs')
source=("http://ftp.halifax.rwth-aachen.de/gnu/c-graph/$pkgname-$pkgver.tar.gz")
md5sums=('e8a6d310f6063175ca77ff49762977c5')
# or any other gnu mirror

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make -k || true
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
