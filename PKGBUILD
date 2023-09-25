# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-composite-blur
pkgver=1.0.5
pkgrel=1
pkgdesc="Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-composite-blur"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0829408a960df43b2cdbd172f919ed77bfbf21e003bebab1964ab06e196c8fa3da7581d0231a3d22e1ec47d411e9f8a59d4a38e66c480c057c1a0671dbcb5802')

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
