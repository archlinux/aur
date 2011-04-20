# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.5.2
pkgrel=1
pkgdesc="Background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
install=nitrogen.install
source=(http://projects.l3ib.org/nitrogen/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('dd779a252a222eb9d329d74b809cfe73')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
