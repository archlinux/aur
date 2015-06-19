# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=cowloop
pkgver=3.2.0.1
pkgrel=2
pkgdesc="Utilities for copy-on-write loop driver (block device) to be used on top of any other block driver"
arch=('i686' 'x86_64')
url="http://www.atcomputing.nl/Tools/cowloop/"
license=('GPL2')
depends=('glibc' 'kernel26>=2.6.31')
makedepends=('kernel26-headers>=2.6.31')
source=("http://www.atcomputing.nl/Tools/cowloop/packages/$pkgname-$pkgver.tar.gz")
md5sums=('a64f1411fe5e968ded40b5476ff948b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cd src
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
