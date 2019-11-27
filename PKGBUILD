# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lib32-libtas
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries (32-bit support)"
pkgver=1.3.5
pkgrel=1
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('lib32-alsa-lib' 'lib32-ffmpeg' 'lib32-fontconfig'
         'lib32-freetype2' 'libtas' 'lib32-zlib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ea2601b0790bf705b7552cf479ca04d04bef156e55f63558df37e4217c3b56a81950d3b5d37351a6782b205c37f49f95c0fbeac7a33b3da3f9a3278408926911')

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
