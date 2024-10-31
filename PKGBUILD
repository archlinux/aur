# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ctsGE
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Clustering of Time Series Gene Expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ccapp
  r-ggplot2
  r-limma
  r-reshape2
  r-shiny
  r-stringr
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-dt
  r-geoquery
  r-knitr
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9babf1c70d14f3617f3ff33045178aedf272715bcb2d850e08ca6e1999081b59')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
