# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-fontconfig'
         'lib32-freetype2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('608c92b74f47e1aaaaf0a6830884f06124a10608e2587eeeafeaba506272a560ca7423f54aed9e117e58419ba35d089b1cbcf303e4b1d4d937e4d9456ec8c9af')

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
