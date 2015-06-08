# Maintainer: Gabriel Laskar <gabriel at lse dot epita dot fr>
pkgname=oksh
pkgver=0.5.0
pkgrel=1
url="http://www.connochaetos.org/oksh"
pkgdesc="Ported version of ksh from OpenBSD"
license=('GPL3')
depends=('glibc')
arch=('i686' 'x86_64')
source=(http://www.connochaetos.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e8118f06ac41ff7ce416706ffc649192')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" mandir=$pkgdir/usr/share/man/man1 install
}

# vim:set ts=2 sw=2 et:
