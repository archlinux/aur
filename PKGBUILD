# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=sc18
pkgrel=1
pkgdesc="A simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
source=("https://github.com/arminbiere/cadical/archive/$pkgver.tar.gz")
md5sums=('cbc2e33e5cb9790bf8b552f1d0d2743b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd build
  install -Dm755 cadical      "$pkgdir/usr/bin/cadical"
  install -Dm755 libcadical.a "$pkgdir/usr/lib/libcadical.a"
}

