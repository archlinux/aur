# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-pipewire
pkgver=6.7.5
pkgrel=1
pkgdesc='X11-focused PipeWire components for SonicDE'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-pipewire'
license=(LGPL-2.0-or-later)
depends=(ffmpeg
         glibc
         libdrm
         libepoxy
         libgcc
         libpipewire
         libstdc++
         libva
         mesa
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons)
makedepends=(ki18n
             sonic-frameworks-cmake-modules)
provides=(kpipewire)
conflicts=(kpipewire)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8cec77c3cdb7535082b54708ed038c66d998133ec10da77f2cc3de0e44867c9d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
