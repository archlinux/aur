# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISAnalytics
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Analyze gene therapy vector insertion sites data identified from genomics next generation sequencing reads for clonal tracking studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biocparallel
  r-data.table
  r-dplyr
  r-fs
  r-ggplot2
  r-ggrepel
  r-lifecycle
  r-lubridate
  r-magrittr
  r-psych
  r-purrr
  r-rcapture
  r-readr
  r-readxl
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
  r-zip
  r-forcats
  r-shiny
  r-shinywidgets
  r-datamods
  r-bslib
  r-dt
)
optdepends=(
  r-biocstyle
  r-circlize
  r-covr
  r-eulerr
  r-extradistr
  r-flexdashboard
  r-ggalluvial
  r-gridextra
  r-gtools
  r-knitr
  r-plotly
  r-r.utils
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-scales
  r-sessioninfo
  r-testthat
  r-vegan
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('56af8922343baf56a710601a5ad9413af2ca1e46c6a10184d68b35e63ba053d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
