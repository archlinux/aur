# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=runawk
pkgver=1.5.1
pkgrel=1
pkgdesc="AWK wrapper that provides support for modules"
arch=('i686' 'x86_64')
makedepends=('bmake' 'mk-configure')
url="https://github.com/cheusov/runawk"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('b4f7dc2bb200c0147ada4bdecad5cd19100eca64bb38fda97b8178243cb4da4b')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  mkcmake all
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Testing...'
  mkcmake test
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  mkcmake DESTDIR="$pkgdir" install
}
