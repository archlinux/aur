# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=ink
pkgver=0.5.2
pkgrel=1
pkgdesc="Command line tool for checking the ink level of printers"
arch=('i686' 'x86_64')
url="http://ink.sourceforge.net/"
license=('GPL2')
depends=('libinklevel')
source=(http://downloads.sourceforge.net/ink/ink-$pkgver.tar.gz)
md5sums=('9dac3e63797d8b0e53fb57b31e648ae8')

build() {
  cd "$srcdir/ink-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ink-$pkgver"
  make DESTDIR=$pkgdir install
}
