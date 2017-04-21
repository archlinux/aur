# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=3.25.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=('gsl' 'glib2' 'gtk3' 'libgee' 'libx11')
makedepends=('vala' 'glib2' 'cmake' 'intltool' )
source=(https://github.com/rastersoft/cronopete/archive/${pkgver}.tar.gz)
sha512sums=('9e8f27725d733e5a3a0c59ea246999f612c07eb827c1b799d8750b09ffa49b8345fa006e9a32e3baddb0ebc4d2f8dff8061f290928fa701638f7edcb12852b36')
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
