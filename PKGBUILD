# Contributer: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=scanssh
pkgver=2.1
pkgrel=3
pkgdesc="Fast SSH server and open proxy scanner."
arch=(i686)
depends=('libdnet' 'libevent' 'openssl')
url="http://www.monkey.org/~provos/scanssh/"
license="GPL"
arch=(i686 x86_64)

source=(http://www.monkey.org/~provos/$pkgname-$pkgver.tar.gz)

md5sums=('9fab4253b56b2d15367d4872b370cdcb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install
}
