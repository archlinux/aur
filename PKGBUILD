# Maintainer: weqeqq <ggmodwear@gmail.com> 

pkgname=iterable-cpp-git 
pkgver=r4.a6e65c0
pkgrel=1
pkgdesc="C++ library that provides a helper class to simplify custom iterator implementation."
arch=(any)
url="https://github.com/weqeqq/iterable-cpp"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('iterable-cpp')
conflicts=('iterable-cpp')
source=("git+https://github.com/weqeqq/iterable-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/iterable-cpp"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/iterable-cpp"

  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build 
}

package() {
  cd "$srcdir/iterable-cpp"

  DESTDIR="$pkgdir" cmake --install build
}
