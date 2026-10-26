# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://forge.dnaka91.rocks/dnaka91/pkgbuilds

pkgname=obs-stroke-glow-shadow
pkgver=1.6.1
pkgrel=1
pkgdesc="OBS plugin to provide efficient Stroke, Glow, and Shadow effects on masked sources"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-stroke-glow-shadow"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('cb1e381e1fa1c2d37bd877c9dd6a3b639e7017bf7fd3c62ae358409e099b42084bbdd7342d4293da5dea54f996aa36a731687aa0ea32cc5ce1f1d3a6063391cd')

build() {
  cmake -B build -S "$pkgbase-$pkgver" -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cmake --install build
}
