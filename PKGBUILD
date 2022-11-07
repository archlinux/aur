pkgname=xstow
pkgver=1.1.0
pkgrel=1
pkgdesc="XStow is a replacement of GNU Stow written in C++. It supports all features of Stow with some extensions."
arch=('i686' 'x86_64')
url="https://xstow.sourceforge.net"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('a568f7e64fc0c39829348942a8dfd343')

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
