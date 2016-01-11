# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=mmdb2
conflicts=mmdb
pkgver=2.0.5
pkgrel=1
pkgdesc="A C++ toolkit for working with macromolecular coordinate files"
arch=('i686' 'x86_64')
url="https://launchpad.net/mmdb"
license=('LGPL')
source=(ftp://ftp.ccp4.ac.uk/opensource/$pkgname-$pkgver.tar.gz)
sha256sums=('7be92fa9348c83384111687e8e093dcc92f609e6caaad78f6275317aa0de1320')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
