# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCOBRA
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Comparison and Visualization of Ranking and Assignment Methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-dt
  r-ggplot2
  r-limma
  r-reshape2
  r-rocr
  r-scales
  r-shiny
  r-shinybs
  r-shinydashboard
  r-upsetr
  r-markdown
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('55eab9205fa9bc2f65ceb834e3577ce186e2a82d87d434633870ae3719d2d43b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
