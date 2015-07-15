# Contributor: Adria Arrufat <swiftscythe at gmail _dot_com>

pkgname=cronopete
pkgver=3.16.0
pkgrel=1
pkgdesc="An Apple's Time Machine clone"
arch=('i686' 'x86_64')
url="http://www.rastersoft.com/programas/cronopete.html"
license=('GPL2')
depends=('gtk3' 'vala' 'gsl' 'libgee')
source=(https://github.com/rastersoft/cronopete/archive/v${pkgver}.tar.gz)
md5sums=('1f8200dcf187606554e637bf213c2f80')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNO_APPINDICATOR=on ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
