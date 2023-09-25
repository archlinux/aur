# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-composite-blur
pkgver=1.0.4
pkgrel=1
pkgdesc="Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-composite-blur"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('51b86c4d65d9a234b799b1b3b86d1b91c973524e469ef33f8171a114270b16d98125ee555c0064fc370ddc834518d98e907924123166d5d8316b0c6d41ea280d')

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
