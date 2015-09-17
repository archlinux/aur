# Maintainer: strigyskow
pkgname=libgaiagraphics
pkgver=0.5
pkgrel=1
pkgdesc="libgaiagraphics is an open source library supporting common-utility raster handling methods."
url="https://www.gaia-gis.it/fossil/libgaiagraphics/home"
arch=('x86_64' 'i686')
license=('LGPLv3')
depends=(libgeotiff)
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://www.gaia-gis.it/gaia-sins/libgaiagraphics-${pkgver}.tar.gz")
md5sums=('2fdc2f155718e9f20dcdf10e474fc225')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix="/usr"
  make
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
