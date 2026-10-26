# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://forge.dnaka91.rocks/dnaka91/pkgbuilds

pkgname=obs-retro-effects
pkgver=1.1.1
pkgrel=1
pkgdesc="A collection of OBS filters to give your stream that retro feel"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-retro-effects"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('3ea54858839f0fcbfe3d6cfaa9cfd2235498b091a6fc949e114f5463b0fea577452041fdecb68841e986aefd769d3c9ffc4d5a2388cfb521db5c6ce8dc98853b')

build() {
  cmake -B build -S "$pkgbase-$pkgver" -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cmake --install build
}
