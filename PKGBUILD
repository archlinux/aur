# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TPP
_pkgver=3.28.0
pkgname=r-${_pkgname,,}
pkgver=3.28.0
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
sha256sums=('d18e7581e2864a1c7180c0adc2f631cfe37095edd922fe231f84e7761a047ae9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
