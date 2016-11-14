# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.6.0
pkgrel=2
pkgdesc="Background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
source=(http://projects.l3ib.org/nitrogen/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('194a423fa4d24db069a64d2ffa1e4ece2e65d2466aed9ee037a59f3d141634de')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

