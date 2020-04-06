# Maintainer: Isabelle Lightray <supremeep@yandex.ru>
pkgname=today-todo
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple todo list with deadlines."
arch=('i686' 'x86_64')
url="https://github.com/is3ny/today"
license=('BSD')
conflicts=('today')
makedepends=(
  'git'
  'cmake'
  'boost'
  'boost-libs'
)
source=("today-${pkgver}.tar.gz::https://github.com/is3ny/today/archive/v${pkgver}.tar.gz")
sha1sums=('7c6efe4ecb6d1d61dd5fe4b952302db612b85e38')

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
