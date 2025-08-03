# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-retro-effects
pkgver=1.0.1
pkgrel=1
pkgdesc="A collection of OBS filters to give your stream that retro feel"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-retro-effects"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('8752974c0a01e2517bf963123061390a38d9455db652e86b14f0ecafb77ed2d6774a7f6869bb8539c668d5b0fc9a70af3367366d48acfd15f286d391a7243e00')

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
