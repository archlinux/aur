# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=xlivebg
pkgver=1.0
pkgrel=2
pkgdesc="Live wallpapers for the X window system"
arch=('x86_64')
url="http://nuclear.mutantstargoat.com/sw/xlivebg"
license=('GPL3')
depends=('glu'
         'ffmpeg4.4'
         'libxrandr'
         'openmotif')
makedepends=("${depends[@]}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jtsiomb/xlivebg/archive/v${pkgver}.tar.gz")
sha256sums=('58bc89d263f32c5ac69a86c99ad715d2a3e87a225f6803d247db6f4bda7d7064')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-all
}
