# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor : Geraud Le Falher <daureg@gmail.com>

pkgname=log4cpp
pkgver=1.1.4
pkgrel=2
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations."
arch=('x86_64')
url="http://log4cpp.sourceforge.net/"
license=('LGPL')
depends=('gcc-libs' 'libnsl')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

