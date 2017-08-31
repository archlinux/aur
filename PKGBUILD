# $Id$
# Maintainer: Hermann Mayer <hermann.mayer92@gmail.com>

pkgname=colorpicker
commit=f5d441a
pkgver=1.0.${commit}
pkgrel=2
pkgdesc="Click on a pixel on your screen and print its color value in RGB. Written for X11."
arch=('i686' 'x86_64')
url="https://github.com/Jack12816/colorpicker"
license=('MIT')
depends=('gtk2' 'gdk-pixbuf2' 'libx11' 'libxcomposite' 'libxfixes' 'libxext' 'cairo')
makedepends=('make')
source=(https://github.com/Jack12816/colorpicker/archive/${commit}.tar.gz)
sha1sums=('962bd3ef627b32d4ac61c844b570e33b7a1dc647')

build() {
  cd colorpicker*
  make
}

package() {
  cd colorpicker*
  mkdir -m755 -p ${pkgdir}/usr/bin
  install -m777 colorpicker ${pkgdir}/usr/bin/
}
