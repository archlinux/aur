# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spacetime
_pkgver=1.2-8
pkgname=r-${_pkgname,,}
pkgver=1.2.8
pkgrel=1
pkgdesc='Classes and Methods for Spatio-Temporal Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-intervals
  r-sp
  r-xts
  r-zoo
)
optdepends=(
  r-adehabitatlt
  r-cshapes
  r-foreign
  r-googlevis
  r-gstat
  r-isocodes
  r-knitr
  r-mapdata
  r-maps
  r-maptools
  r-markdown
  r-plm
  r-raster
  r-rcolorbrewer
  r-rgdal
  r-rgeos
  r-rpostgresql
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4297a027ab4cff32e41cec65aa7d92af66c7a885fd2322b010b0af9a14f24c59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
