# Maintainer: SanskritFritz (gmail)
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dennis Gosnell <cdep.illabout@gmail.com>

pkgname=libdockapp
pkgver=0.7.2
pkgrel=1
pkgdesc="Library that provides a framework for developing dockapps."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/${pkgname}"
license=('GPL')
options=('!libtool')
depends=(libxpm)
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('219e042f8200448eaa34bdf4fc4aa820')

build() {
  cd dockapps-*
  autoreconf -fvi
  ./configure --prefix=/usr/ --without-examples --without-font
  make
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir/" install
  ln -s libdockapp/dockapp.h "$pkgdir/usr/include/dockapp.h"
}
