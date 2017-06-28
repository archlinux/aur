# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=3.26.0
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=('gsl' 'glib2' 'gtk3' 'libgee' 'libx11')
makedepends=('vala' 'glib2' 'cmake' 'intltool' )
source=(https://github.com/rastersoft/cronopete/archive/${pkgver}.tar.gz)
sha512sums=('c60fde103771991c22b24c2dc21bbc923d92a0f8056dfd1bb5a1933acace2165ded147fbff4d8852b9fd2f88749376652f949642225fed1707852b5e580664e8')
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
