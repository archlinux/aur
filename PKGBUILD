# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-composite-blur
pkgver=1.0.3
pkgrel=1
pkgdesc="Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-composite-blur"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9ec3a8626b7ec2c222e9dce58677649286da117ab68e7dbbb7d25f91795f2cc9d94145c1aa76c2da1e4c01b4a8b1b463041dfe036676470cade15dfa31e6cf79')

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
