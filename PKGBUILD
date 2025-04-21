# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=foma
pkgver=0.10.0.r25.gb9c06b3
pkgrel=1
pkgdesc="A set of utilities for constructing finite-state automata and transducers"
arch=('i686' 'x86_64')
url="https://fomafst.github.io/"
license=('Apache')
depends=('zlib' 'readline')
makedepends=('cmake')
source=(git+https://github.com/mhulden/foma.git#commit=b9c06b3fb0a531c8ccc7917c53ff2ffe2b9cf062)
sha256sums=('SKIP')

build() {
    local cmake_options=(
    -B build
    -S $pkgname/foma
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  cmake "${cmake_options[@]}"
  cmake --build build  
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
