# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20200303
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vttest/"
license=('MIT')
depends=('glibc')
source=("https://invisible-island.net/datafiles/release/vttest.tar.gz")
sha512sums=('dcd32e5e2bd2c2be0c068f84473efbe955ef7c5c8e9dab85f8ef57b7704ddb1c6d2daa81f25f3bd7424208ccb15c6013f40ede4355c98800d523be835921430d')

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