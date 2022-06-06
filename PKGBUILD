# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LACE
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Longitudinal Analysis of Cancer Evolution (LACE)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-data.tree
  r-igraph
  r-rcolorbrewer
  r-rfast
  r-summarizedexperiment
  r-curl
  r-foreach
  r-doparallel
  r-sortable
  r-dplyr
  r-purrr
  r-stringr
  r-tidyr
  r-jsonlite
  r-readr
  r-configr
  r-dt
  r-fs
  r-data.table
  r-htmltools
  r-htmlwidgets
  r-bsplus
  r-shiny
  r-shinythemes
  r-shinyfiles
  r-shinyjs
  r-shinybs
  r-shinydashboard
  r-biomart
  r-callr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1caf829d25051d56159f3dc155ae4e1f726f6547ada3df22890f4e4938345557')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
