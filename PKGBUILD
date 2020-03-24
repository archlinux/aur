# Maintainer: Isabelle Lightray <supremeep@yandex.ru>
pkgname=today-todo
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple todo list with deadlines."
arch=('i686' 'x86_64')
url="https://github.com/is3ny/today"
license=('BSD')
conflicts=('today')
depends=(
  'boost'
  'boost-libs'
  'git'
)
makedepends=(
  'cmake'
)
source=("today-${pkgver}.tar.gz::https://github.com/is3ny/today/archive/v${pkgver}.tar.gz")
sha1sums=('45341368c62091fbe68e5f1fcdd622eb31b6d879')

build() {
  cd "$srcdir/today-$pkgver"
  ls .
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  make
}

package() {
  cd "$srcdir/today-$pkgver/build"
  make install
}
