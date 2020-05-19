# Maintainer: Di Campli Raffaele <dcdrj.pub@gmail.com>

_pkgname=slog
pkgname="lib${_pkgname}-git"
pkgver=1.6.b1.2f9b9ca
pkgrel=6
pkgdesc="Simple and thread safe logging library for C/C++"
arch=('any')
url='https://github.com/kala13x/slog'
license=('MIT')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
source=('git+https://github.com/kala13x/slog.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/src"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/src"
  make -l $(nproc)
}

package() {
  cd "$srcdir/$_pkgname/src"
  install -Dm 0664 libslog.a "$pkgdir/usr/local/lib/libslog.a"
  install -Dm 0664 slog.h "$pkgdir/usr/local/include/slog.h"
}
