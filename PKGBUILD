# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://forge.dnaka91.rocks/dnaka91/pkgbuilds

pkgname=obs-noise
pkgver=1.1.1
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-noise"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('aa8de1897a10a1f694af5bdd7497f09b94ffb556e8b2469867874178763eb17e5ac6264da0e47940086eb6ec953ead4c81c9b312bc99fa806f1963d80a1bc3b7')

build() {
  cmake -B build -S "$pkgbase-$pkgver" -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cmake --install build
}
