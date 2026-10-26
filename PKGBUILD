# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://forge.dnaka91.rocks/dnaka91/pkgbuilds

pkgname=obs-composite-blur
pkgver=1.6.1
pkgrel=1
pkgdesc="Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-composite-blur"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c68ec3d74ae06a9d6851689fcb0d47099f68cf98f838c1816a72a9e5676012bc6ae9f8d680ebfa2bc7ef06cd28d40aea4b0507e3466f09d693f5221a3708305a')

build() {
  cmake -B build -S "$pkgbase-$pkgver" -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cmake --install build
}
