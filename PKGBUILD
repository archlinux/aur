# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Lucas Magalhães <whoisroot@national.shitposting.agency>
pkgname=rocm-clang-ocl
pkgver=3.5.0
pkgrel=1
pkgdesc="OpenCL compilation with clang compiler."
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/clang-ocl"
license=('unknown')
makedepends=('cmake' 'rocm-cmake')
source=("${pkgname}-${pkgver}::https://github.com/RadeonOpenCompute/clang-ocl/archive/rocm-$pkgver.tar.gz")
sha256sums=('38c95fbd0ac3d11d9bd224ad333b68b9620dde502b8a8a9f3d96ba642901e8bb')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/clang-ocl-rocm-$pkgver"

  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
