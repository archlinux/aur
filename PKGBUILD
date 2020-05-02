# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=vttest
pkgver=20200420
pkgrel=1
pkgdesc="Tool for testing VT100 compatibility of terminals"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vttest"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tgz::ftp://ftp.invisible-island.net/vttest/vttest-${pkgver}.tgz")
sha256sums=('6c9019c72c31b12d861783890a50ec5145a3424ee634c319b158af9af630910e')

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