# system requirements: GEOS (>= 3.5.0), PROJ (>= 4.8.0), sqlite3
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=lwgeom
_pkgver=0.2-10
pkgname=r-${_pkgname,,}
pkgver=0.2.10
pkgrel=1
pkgdesc="Bindings to Selected 'liblwgeom' Functions for Simple Features"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  geos
  proj
  r
  r-rcpp
  r-sf
  r-units
  sqlite
)
optdepends=(
  r-covr
  r-geosphere
  r-sp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee1ff8a4f76fa884ee5f0d6ede6fb184951c78c771762cef0c8ffe4ab0b8bbbd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
