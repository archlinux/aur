pkgname=xstow
pkgver=1.0.2
pkgrel=2
pkgdesc="XStow is a replacement of GNU Stow written in C++. It supports all features of Stow with some extensions."
arch=('i686' 'x86_64')
url="http://xstow.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('685fe4f3db3c363191e836082dc0d512')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-curses=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
