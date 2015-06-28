# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb2
conflicts=mmdb
pkgver=2.0.1
pkgrel=1
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz)
sha256sums=('6df04205747ae35cd62edc9649ab0187f902a56fb16f355cbdbdc7ca3e14b6bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
