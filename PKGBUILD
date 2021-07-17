# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.2
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'lib32-libx11' 'lib32-sdl2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('f006f2f3c41daae68dd1802ba7ff0ebe25500cb08a96a6c222ca5322c55c5a5e551be73ea5c8a190bdd3fd122ba03e9873b5afbd228b117d170053880c6d123a')

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
