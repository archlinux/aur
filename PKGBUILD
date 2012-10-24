# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor : Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp
pkgver=1.0
pkgrel=6
pkgdesc='Library of C++ classes for flexible logging to files, syslog, IDSA and other destinations'
arch=('i686' 'x86_64')
url="http://log4cpp.hora-obscura.de/"
license=('LGPL')
depends=('gcc-libs')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz gcc43.patch)
md5sums=('1face50ead0790d1297dfb04bacf273c'
         '09a6fd8ab6527a417c97c4db5215e558')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir"/gcc43.patch
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: set ft=sh ts=2 sw=2 et:
