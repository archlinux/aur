# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
md5sums=('79a7070b4ae539d14accaea2687c98d3')

build() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd src
  install -Dm644 cadical.hpp  "$pkgdir/usr/include/cadical.hpp"
  cd ..
  cd build
  install -Dm755 cadical      "$pkgdir/usr/bin/cadical"
  install -Dm755 libcadical.a "$pkgdir/usr/lib/libcadical.a"
}

