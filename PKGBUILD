# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpengine
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
pkgdesc='Free implementation of Nitroplus Visual Novel game engine'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpa=$pkgver" 'boost-libs' 'sdl2' 'glew' 'libjpeg-turbo' 'libpng'
        'gst-plugins-base-libs' 'pango')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname-new/archive/v$pkgver.tar.gz")
sha256sums=('094e605ffe82f601ed827504710515dad1c3450e5aa44d57355d376a62017e21')

build() {
  cd $pkgname-new-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-new-$pkgver DESTDIR="$pkgdir/" install
}
