# Maintainer: marcelhuberfoo <marcelhuberfoo ät gmail döt com>
pkgname=xstow++
pkgver=1.0.3
pkgrel=1
pkgdesc="XStow is a replacement of GNU Stow written in C++. It supports all features of Stow with some extensions. Unofficial fork with some extra patches merged."
arch=('x86_64')
url="https://github.com/rspeed/xstow"
license=('GPL')
depends=('ncurses')
source=(${pkgname}.${pkgver}.tar.gz::https://github.com/rspeed/xstow/releases/download/v${pkgver}/xstow-${pkgver}.tar.bz2)
md5sums=('50930488a1fb78e05884b352d4bb2c7f')

build() {
  cd "$srcdir/${pkgname/++/}-$pkgver"
  ./configure --prefix=/usr --with-curses=/usr
  make
}

check() {
  cd "$srcdir/${pkgname/++/}-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/${pkgname/++/}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
