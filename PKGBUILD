# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=runawk
pkgver=1.6.0
pkgrel=1
pkgdesc="AWK wrapper that provides support for modules"
arch=('i686' 'x86_64')
makedepends=('bmake' 'mk-configure')
url="https://github.com/cheusov/runawk"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('363032efa8adc49d7446b31782ca49b76913b8fd07b315a3d03c67d3d329620e')

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
