# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor : Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp
pkgver=1.1.1
pkgrel=1
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations."
arch=('i686' 'x86_64')
url="http://log4cpp.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1e173df8ee97205f412ff84aa93b8fbe')

build() {
	cd "$srcdir/$pkgname"
  export CXXFLAGS="$CXXFLAGS -lpthread"
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa
	make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: set ft=sh ts=2 sw=2 et:
