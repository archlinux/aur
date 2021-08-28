# Maintainer: Posi <posi1981@gmail.com>

pkgname=clex
pkgver=4.6.patch10
pkgrel=2
pkgdesc="File manager with a full-screen user interface"
arch=('i686' 'x86_64')
url="http://www.clex.sk"
license=('GPL2')
depends=('ncurses')
source=($url/download/$pkgname-$pkgver.tar.gz)
sha256sums=('1c3aa2a37e858359636fa8e82229e2bb5459548e9820266a3efd9e32318cd10e')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
