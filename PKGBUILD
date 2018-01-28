# Contributer: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=scanssh
pkgver=2.1
pkgrel=4
pkgdesc="Fast SSH server and open proxy scanner."
depends=('libdnet' 'libevent' 'openssl')
url="http://www.monkey.org/~provos/scanssh/"
license=("GPL")
arch=(i686 x86_64)

source=(http://www.monkey.org/~provos/$pkgname-$pkgver.tar.gz)

md5sums=('9fab4253b56b2d15367d4872b370cdcb')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
