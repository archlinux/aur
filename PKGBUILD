# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=obs-noise
pkgver=1.0.0
pkgrel=1
pkgdesc="Advanced Masking Plugin for OBS"
arch=('x86_64')
url="https://github.com/FiniteSingularity/obs-noise"
license=('GPL-2.0-or-later')
depends=('glibc' 'obs-studio')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7b5dd7369252418988faa80db4144c9e663b4210eb18639053ea3e8ba0253633cc8742f5d2f62d4fcf8d40162829f979e7e2db1e3dd6053e0f6fdb8db8c49c34')

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
