# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor : Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp
pkgver=1.1.3
pkgrel=3
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations."
arch=('x86_64')
url="http://log4cpp.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libnsl')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

