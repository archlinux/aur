# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spacetime
_pkgver=1.3-0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=3
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
  r-markdown
  r-plm
  r-raster
  r-rcolorbrewer
  r-rmarkdown
  r-rpostgresql
  r-sf
  r-sftime
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e9902a5c6f355f0b8e23237cf3b1553f22d7d79493bdbdb99e49104b9ef541b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
