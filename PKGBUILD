# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=sobby
pkgver=0.4.8
pkgrel=1
pkgdesc="Standalone obby server"
url="http://gobby.0x539.de/trac/"
license="GPL"
depends=('obby>=0.4.8' 'libxml++')
makedepends=('pkgconfig' 'net6>=1.3.12')
arch=('i686' 'x86_64')
source=(http://releases.0x539.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1f7cf8c09cdeddbf2152843b28f73ce1')
sha256sums=('a711762c0722e9e7e01934c115dbffc7a233c033d66dbc5d58025af438516f48')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
