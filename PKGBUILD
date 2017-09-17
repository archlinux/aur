# Maintainer: Michał Sidor <packages at meekchopp dot es>
pkgname=pspg-git
pkgver=0.1.r2.g57ba5d8
pkgrel=1
pkgdesc="pager for Postgres"
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses')
makedepends=('git')
source=('git+https://github.com/okbob/pspg')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pspg"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/pspg"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/pspg"
  make
}

package() {
  cd "$srcdir/pspg"
  make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
