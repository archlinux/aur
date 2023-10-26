# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TPP
_pkgver=3.30.0
pkgname=r-${_pkgname,,}
pkgver=3.30.0
pkgrel=1
pkgdesc='Analyze thermal proteome profiling (TPP) experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biobroom
  r-broom
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-futile.logger
  r-ggplot2
  r-gridextra
  r-knitr
  r-limma
  r-magrittr
  r-mefa
  r-nls2
  r-openxlsx
  r-plyr
  r-purrr
  r-rcolorbrewer
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-stringr
  r-tibble
  r-tidyr
  r-venndiagram
  r-vgam
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66c208dc17ba494dd100c918aa32c9f854f9b9f213f2d3755db7e15c45db8e82')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
