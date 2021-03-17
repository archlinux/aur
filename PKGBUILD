# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20200420
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vttest"
license=('MIT')
depends=('glibc')
source=(https://invisible-island.net/datafiles/release/vttest.tar.gz)
sha256sums=('SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR=$pkgdir mandir="/usr/share/man" install
}
