# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-advanced-masks
pkgver=1.0.1
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-advanced-masks"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9e69b80995bed04d80f3f821b30c925e8ae0997b5ec17f5d3d7beb40d4d30507f21e5430ea9404c5c1d6df14b7708874ada3e5f4da0737c9e062e4f8a94ccda1')

build() {
  cmake -B build -S "$pkgbase-$pkgver" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLINUX_PORTABLE=OFF
  cmake --build build
}

package() {
  cmake --install build
}
