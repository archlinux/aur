# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=safe-iop
pkgver=0.3.1
pkgrel=1
pkgdesc='Provides a collection of (macro-based) functions for performing safe integer operations across platform and architecture with a straightforward API'
arch=(any)
license=(BSD)
url='https://code.google.com/p/safe-iop/'
source=(https://safe-iop.googlecode.com/files/safe-iop-$pkgver.tgz)
sha1sums=('1d401b94c04b958a5350e1079781bbfb00cb1a69')

prepare() {
  cd $pkgname-$pkgver 
  # sed -e 's/CFLAGS\W*=/CFLAGS += -fPIC /g' -i Makefile
}

build() {
  cd $pkgname-$pkgver
  # make so
}

package() {
  cd $pkgname-$pkgver
  # use header-only installation
  install -D -m644 include/safe_iop.h "$pkgdir/usr/include/safe_iop.h"
}
