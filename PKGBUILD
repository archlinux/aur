# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LACE
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc='Longitudinal Analysis of Cancer Evolution (LACE)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biomart
  r-bsplus
  r-callr
  r-configr
  r-curl
  r-data.table
  r-data.tree
  r-doparallel
  r-dplyr
  r-dt
  r-forcats
  r-foreach
  r-fs
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-jsonlite
  r-logr
  r-purrr
  r-rcolorbrewer
  r-readr
  r-rfast
  r-shiny
  r-shinybs
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-shinythemes
  r-shinyvalidate
  r-sortable
  r-stringi
  r-stringr
  r-summarizedexperiment
  r-svglite
  r-tidyr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('497779de92bb0a13eebbc80057152f46a49a7ebb3830fb1038466753b51fa660')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
