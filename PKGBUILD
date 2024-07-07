# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.6
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'lib32-libx11' 'lib32-sdl2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('85f5fecc3d92c85372961208087d68782104e4c71ae06ffe4692dfbf1df0d103b4fc48e0a65388a9492aff66510d594a0a70aa306b464b4f1b4ed55289db8db8')

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
