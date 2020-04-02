# Original build: fermyon <antifermion@protonmail.com>
# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=rocm-cmake
pkgver=3.3.0
pkgrel=1
pkgdesc="cmake modules for common build tasks needed for the ROCM software stack"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm-cmake"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/RadeonOpenCompute/rocm-cmake/archive/rocm-$pkgver.tar.gz")
sha256sums=('76ed3ee8e56cf3246011cf7723c2abda539e1136e7e7f6909bfa45d268b8644f')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/$pkgname-rocm-$pkgver"
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
