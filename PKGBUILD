# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
md5sums=('5bd15d1e198d2e904a8af8b7873dd341')

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

