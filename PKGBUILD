# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISAnalytics
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Analyze gene therapy vector insertion sites data identified from genomics next generation sequencing reads for clonal tracking studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-bslib
  r-data.table
  r-datamods
  r-dplyr
  r-dt
  r-forcats
  r-fs
  r-ggplot2
  r-ggrepel
  r-glue
  r-lifecycle
  r-lubridate
  r-purrr
  r-readr
  r-readxl
  r-rlang
  r-shiny
  r-shinywidgets
  r-stringr
  r-tibble
  r-tidyr
  r-vegan
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-circlize
  r-covr
  r-dofuture
  r-eulerr
  r-extradistr
  r-flexdashboard
  r-foreach
  r-future
  r-ggalluvial
  r-gridextra
  r-gtools
  r-jsonlite
  r-knitr
  r-openxlsx
  r-pheatmap
  r-plotly
  r-progressr
  r-psych
  r-r.utils
  r-rcapture
  r-refmanager
  r-rmarkdown
  r-roxygen2
  r-scales
  r-sessioninfo
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45dadb5e9fea25772b58fae56eeb4b1c466bf229d761551e4efd8686bba366b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
