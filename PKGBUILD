# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpengine
pkgver=0.5.3
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
pkgdesc='Free implementation of Nitroplus Visual Novel game engine'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpa=$pkgver" 'boost-libs' 'sdl2' 'glew' 'libjpeg-turbo' 'libpng'
        'gst-plugins-base-libs' 'pango')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9de932632e2ecec0d68bb5ab72cfe5d1995adc9b3ef3a03edd1346e1efd100c0')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
