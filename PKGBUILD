# $Id$
# Maintainer: Mistyhands <mistyhands@pm.me>

pkgname=colorpicker-git
_commit=ba94a3c
pkgver=1.0.${_commit}
pkgrel=2
pkgdesc="A small tool for X11 that writes the color value on your screen at the cursor position to stdout, in RGB."
arch=('i686' 'x86_64')
url="https://github.com/mistyhands/colorpicker"
license=('MIT')
depends=('libx11'
         'xclip')
makedepends=('make')
source=(https://github.com/mistyhands/colorpicker/archive/${_commit}.tar.gz)
sha1sums=('32866feb566705515401d3bb6d258797871a32ad')

build() {
  cd colorpicker*
  make
}

package() {
  cd colorpicker*
  mkdir -m755 -p ${pkgdir}/usr/bin
  install -m777 colorpicker ${pkgdir}/usr/bin/
}
