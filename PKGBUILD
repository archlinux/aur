# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISAnalytics
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=1.6.2
pkgrel=3
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
sha256sums=('5b4e74f5805675dac588e9d380246bb92cd05cbb64c1e0730ee8dd530f815981')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
