# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://forge.dnaka91.rocks/dnaka91/pkgbuilds

pkgname=obs-advanced-masks
pkgver=1.6.1
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-advanced-masks"
license=('GPL-2.0-or-later')
depends=('curl' 'glibc' 'libgcc' 'libstdc++' 'obs-studio' 'qt6-base' 'qt6-svg')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('adc855ec06c57bef1ce8ef0b5bf87af216f614a208c9a4fd65d069a956d98fbdc3a2c94dcc91173b0d474a268e1d6096e5559ebb223099f3a94732c00b169bea')

build() {
  cmake -B build -S "$pkgbase-$pkgver" -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_FRONTEND_API=ON \
    -DENABLE_QT=ON
  cmake --build build
}

package() {
  cmake --install build
}
