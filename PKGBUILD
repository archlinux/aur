# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-advanced-masks
pkgver=1.0.0
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-advanced-masks"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0fce28d9e28c86c805f88410fd1b94ce62c03c5d28b3336d8c8d5545b2c3020a2ca75661b42f52bcd673f6625f3956fcc0c453d40f4fdfdd137217c4855a77aa')

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
