# Maintainer: Di Campli Raffaele <dcdrj.pub@gmail.com>

_pkgname=slog
pkgname="lib${_pkgname}-git"
pkgver=1.6.b1.2f9b9ca
pkgrel=2
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
  cd "$srcdir/$_pkgname/src/slog/src"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/src/slog/src"
  make -l $(nproc)
}

package() {
  cd "$srcdir/$_pkgname/src/slog/src"
  make install
}
