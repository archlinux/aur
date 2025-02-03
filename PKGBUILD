# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=4.3.5
pkgrel=1
pkgdesc="Indent, beautify and relabel Fortran source, generates dependencies"
arch=(i686 x86_64)
url="https://www.ratrabbit.nl/ratrabbit/${pkgname}"
license=(BSD-3-clause)
depends=(bash)
source=(https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('a8d3186221a60913272a1928e7dd6a77d68c114b8eaa5e3b1f2555412d3cd1422551c37d777b67fb5d557d272f7d62953c6ccc52117b67ed12dfb11d01956404')

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
