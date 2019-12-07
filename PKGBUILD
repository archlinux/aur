# Maintainer: Gabriel Laskar <gabriel at lse dot epita dot fr>
pkgname=oksh
pkgver=6.6
pkgrel=1
url="https://github.com/ibara/oksh/"
pkgdesc="Ported version of ksh from OpenBSD"
license=('GPL3')
depends=('glibc' 'ncurses')
arch=('i686' 'x86_64')
source=(https://github.com/ibara/oksh/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d583dfa0f9e4076714ec22a69f138cfd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man/

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
