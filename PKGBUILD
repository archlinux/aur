# Maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: AndreasBWagner
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
pkgname=libmrss
pkgver=0.19.2
pkgrel=2
pkgdesc="C library for parsing, writing and creating RSS/ATOM files or streams"
url="http://www.autistici.org/bakunin/libmrss/"
license="LGPL2"
depends=('curl' 'libnxml')
arch=('i686' 'x86_64')
options=('!libtool')
source=("http://www.autistici.org/bakunin/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a6f66b72898d27270e3a68007f90d62b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

