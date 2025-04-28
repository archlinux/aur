# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pRoloc
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='A unifying bioinformatics framework for spatial proteomics'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-caret
  r-coda
  r-dendextend
  r-e1071
  r-fnn
  r-ggplot2
  r-gtools
  r-hexbin
  r-kernlab
  r-knitr
  r-laplacesdemon
  r-mclust
  r-mixtools
  r-mlinterfaces
  r-msnbase
  r-mvtnorm
  r-plyr
  r-proxy
  r-randomforest
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-sampling
  r-scales
)
optdepends=(
  r-akima
  r-annotationdbi
  r-biocstyle
  r-dplyr
  r-fields
  r-go.db
  r-hpar
  r-magick
  r-nipals
  r-prolocdata
  r-reshape
  r-rgl
  r-rmarkdown
  r-roxygen2
  r-rtsne
  r-testthat
  r-vegan
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7be85ac81438415e5935e4353f4c018e8c154607fc7f41025400c1fdc344b982')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
