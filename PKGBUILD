# Maintainer: Michał Sidor <packages at meekchopp dot es>
pkgname=pspg-git
pkgver=r77.ed052ca
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pspg"
  make
}

package() {
  cd "$srcdir/pspg"
  mkdir -p $pkgdir/usr/bin
  install -m 755 pspg $pkgdir/usr/bin/pspg
}

# vim:set ts=2 sw=2 et:
