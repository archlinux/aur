# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=picotest-git
pkgver=r5.d088dc1
pkgrel=1
pkgdesc='Test::More for the C programming language'
arch=(i686 x86_64)
url='https://github.com/h2o/picotest'
license=(unknown)
makedepends=(git)
source=(git+https://github.com/h2o/picotest)
sha512sums=('SKIP')

pkgver() {
  cd picotest
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd picotest

  gcc -c picotest.c -o picotest.o
  ar rcs libpicotest.a picotest.o

  install -D -m644 picotest.h "$pkgdir"/usr/include/picotest.h
  install -D -m644 libpicotest.a "$pkgdir"/usr/lib/libpicotest.a
}
