# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=3.26.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=('gsl' 'glib2' 'gtk3' 'libgee' 'libx11')
makedepends=('vala' 'glib2' 'cmake' 'intltool' )
source=(https://github.com/rastersoft/cronopete/archive/${pkgver}.tar.gz)
sha512sums=('dc320cb68a96365027c36b9754ac894af3bd7bba65c82920d7a0ff4f14c88145f59a0f35407ce338d41e124b5360184ac8a3d917863c5cd9892e95cb4007f813')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNO_APPINDICATOR=on ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
