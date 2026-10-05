# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.4.1
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://www.ratrabbit.nl/ratrabbit/${pkgname}"
license=(BSD-3-clause)
depends=(bash)
source=(https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ce339319c6d160350e0474442511bf9335ddfbca0f0d03c25ac5b71798a0651b8317f69220a444b415ade5e1b0ea61d4decf408d3ac550d0069c97b74dd2e732')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
