# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=3.28.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=('gsl' 'glib2' 'gtk3' 'libgee' 'libx11')
makedepends=('vala' 'glib2' 'cmake' 'intltool' 'udisks2')
source=(https://github.com/rastersoft/cronopete/archive/${pkgver}.tar.gz)
sha512sums=('d3ad958dec5505c7d93b7b63eeb1da23a167dae813d8e9ad0b909c9653151cf0f6dbcc17a1479ba5b5bfd926eb0f7a6cf247495a658ea83ce8a577ecf6102c5c')
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
