# Maintainer: Galen Gold <galen@galengold.me>
pkgname=espresso-logic
pkgver=1.0
pkgrel=1
pkgdesc="The espresso PLA logic minimization program"
arch=('x86_64')
url="https://github.com/galengold/espresso-logic"
license=('MIT')
source=(https://github.com/galengold/espresso-logic/archive/$pkgver.tar.gz)
md5sums=('73b82c76740d2d5a35e0c7cbe1210d3f')

build() {
  cd "$pkgname-$pkgver/espresso-src"
  make
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  mkdir -p "$pkgdir/usr/share/man/man5"
  install -D "./bin/espresso" "$pkgdir/usr/bin/espresso"
  install -D "./man/espresso.1" "$pkgdir/usr/share/man/man1/espresso.1"
  install -D "./man/espresso.5" "$pkgdir/usr/share/man/man5/espresso.5"
}
