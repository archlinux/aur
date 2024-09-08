# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-retro-effects
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of OBS filters to give your stream that retro feel"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-retro-effects"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('1cb5f115413225a9e7a0639ff4f59c1462b34efe0bb816eae820843884b1051ec691c10b9b163a36d7346e2c76fe07bec4fbd39cf1941b4ede63318bd30939ca')

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
