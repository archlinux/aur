# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeomxTools
_pkgver=3.8.0
pkgname=r-${_pkgname,,}
pkgver=3.8.0
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
sha256sums=('0cc8dbb33b6b7e5e45745ab6e140cc9fc5d2d3e4022a510e74ad468814006924')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
