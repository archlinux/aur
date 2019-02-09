# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.3
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'qt5-base' 'xcb-util-cursor' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('dcb6d7c4d02e55d5c3e4e542c8fc99e6b6476f7f96711024f4a61103b2e5aa61c83994cb45b7510727e3e2f3201efb738929f495a0939874fcd09818513c6f1e')

build() {
  cd "libTAS-$pkgver"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
