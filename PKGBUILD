# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.6.1
pkgrel=2
pkgdesc="Background browser and setter for X windows"
arch=('x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
validpgpkeys=('5B8B00633A07437835C80B7F1E39A08EDAB8F316') # keybase.io/daf <daf@keybase.io>')
source=("https://github.com/l3ib/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('f40213707b7a3be87e556f65521cef8795bd91afda13dfac8f00c3550375837d'
            'SKIP')

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

