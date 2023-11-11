pkgname=libfirefly2
pkgver=2.1.0
pkgrel=2
pkgdesc='A standalone C++ Library for vectors calculations'
arch=(x86_64)
url='https://github.com/tbhaxor/firefly/tree/v2.1.0#readme'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'make' 'git')
source=("https://github.com/tbhaxor/firefly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4de4b216c73199a1826de7a0d45205b401603315347d7947d8b5950d3e6b893d')
options=('staticlibs')
conflicts=('libfirefly-git')

prepare() {
  cmake -Bbuild -S"firefly-$pkgver" -DFirefly_ENABLE_DOUBLE_PRECISION=ON
}

build() {
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
