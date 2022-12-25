# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeomxTools
_pkgver=3.2.0
pkgname=r-${_pkgname,,}
pkgver=3.2.0
pkgrel=3
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
sha256sums=('467fc6d5f078d67a51c5d9c747ec7e5dcf3c575cb2d78bad6c08f768b46814e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
