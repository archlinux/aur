# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-advanced-masks
pkgver=0.0.7
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-advanced-masks"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}a.tar.gz")
b2sums=('d78427904c1a7a06ccf248410f59c961b3955b3569b2a8d16fbb3538b5db111033d21931c7dc2b629b69fe362621db7f56d32088c8fc501fb26469811bcb30b4')

build() {
  cmake -B build -S "$pkgbase-${pkgver}a" \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLINUX_PORTABLE=OFF
  cmake --build build
}

package() {
  cmake --install build
}
