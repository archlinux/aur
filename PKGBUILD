# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-retro-effects
pkgver=1.0.2
pkgrel=1
pkgdesc="A collection of OBS filters to give your stream that retro feel"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-retro-effects"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('50d9e069727f6761977ee8d94742776de7600a4837a7da61b92319c54aca50a774b2877c50ff2cf46c3e6fa624fa08f9e7e234c5715c1c95db695a82c92637b6')

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
