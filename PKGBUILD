# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=mccs
pkgver=1.1
pkgrel=1
pkgdesc="Multi  Criteria CUDF Solver"
arch=('i686' 'x86_64')
url="http://www.i3s.unice.fr/~cpjm/misc/mccs.html"
license=('custom')
depends=('glpk')
source=("http://www.i3s.unice.fr/~cpjm/misc/mccs-1.1-srcs.tgz")
sha256sums=('b69a519eea835a9f489241aa21c5c5d143094739906fe02b0319447e4bb7bec9')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/ -lfl//g" makefile
}

build() {
  cd "$pkgname-$pkgver"
  make USEGLPK=1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 mccs "$pkgdir/usr/bin/mccs"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/mccs/LICENSE"
}
