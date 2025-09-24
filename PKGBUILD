# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeomxTools
_pkgver=3.12.1
pkgname=r-${_pkgname,,}
pkgver=3.12.1
pkgrel=1
pkgdesc='NanoString GeoMx Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-data.table
  r-dplyr
  r-envstats
  r-ggally
  r-ggplot2
  r-lmertest
  r-nanostringnctools
  r-readxl
  r-reshape2
  r-rjson
  r-rlang
  r-s4vectors
  r-seuratobject
  r-stringr
)
optdepends=(
  r-ggiraph
  r-knitr
  r-parallel
  r-patchwork
  r-rmarkdown
  r-seurat
  r-spatialdecon
  r-spatialexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3472a7918de3b2396c3c73171a11726172514e08b43ede4ff7217772725c6fef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
