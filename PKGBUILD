# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=wmcalc
pkgver=0.6
pkgrel=1
pkgdesc="Dockapp that performs all the functions (and eventually more) of a simple four function calculator"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/${pkgname}"
license=('GPL')
groups=('x11')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d84c4e1cdb8742c5abf03a34ea03540')

build() {
  cd dockapps-*
  make clean
  make INCLUDES=-I/usr/include/X11
}
package() {
  cd dockapps-*
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
