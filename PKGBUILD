# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.3
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'lib32-libx11' 'lib32-sdl2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('2f514b74ac4e3d915198fc88e70d495d1cf9a2f794e7a4416089d876a246d9b593278a0e4d2e7604d486b11033a4d1e7cc884dad208938d9075ffc63dc1ef11c')

prepare() {
  cd "libTAS-$pkgver"

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  ./configure --prefix=/usr --enable-i386-lib
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
