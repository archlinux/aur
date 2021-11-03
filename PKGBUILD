# Maintainer: Nogweii <me@nogweii.net>

pkgname=ktermlaunch
pkgver=0.2.0
pkgrel=2
pkgdesc='Launch your preferred terminal emulator per your KDE settings'
arch=(x86_64)
url='https://nogweii.net/projects/ktermlaunch.html'
license=(LGPL2.1)
depends=(kservice)
makedepends=(extra-cmake-modules kdoctools cmake ninja)
source=("https://code.aether.earth/nogweii/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('39c87fec981ef2a29df7c8fc95341ca6b5664410028adc3a124477e2d913d26e')

build() {
  cmake -B build -S $pkgname-v$pkgver -G Ninja \
    -Wdev -Werror=dev \
    -Wdeprecated -Werror=deprecated \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
