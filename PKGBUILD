# Maintainer: weqeqq <ggmodwear@gmail.com> 

pkgname=config-cpp-git 
pkgver=r6.b8cf2e2
pkgrel=1
pkgdesc="C++ library for reading and writing config files."
arch=(any)
url="https://github.com/weqeqq/config-cpp"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'gcc')
provides=('config-cpp')
conflicts=('config-cpp')
source=("git+https://github.com/weqeqq/config-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/config-cpp"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/config-cpp"

  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build 
}

package() {
  cd "$srcdir/config-cpp"

  DESTDIR="$pkgdir" cmake --install build
}
