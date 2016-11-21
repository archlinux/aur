# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpengine
pkgver=0.5.1
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
pkgdesc='Free implementation of Nitroplus Visual Novel game engine'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpa=$pkgver" 'boost-libs' 'sdl2' 'glew' 'libjpeg-turbo' 'libpng'
        'gst-plugins-base-libs' 'pango')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname-new/archive/v$pkgver.tar.gz")
sha256sums=('11041427c5156da235a47fbdc03868653422b10557c77ef717b51e23e1e8a4a5')

build() {
  cd $pkgname-new-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-new-$pkgver DESTDIR="$pkgdir/" install
}
