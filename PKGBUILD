# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fobitools
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Tools For Manipulating FOBI Ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clisymbols
  r-crayon
  r-dplyr
  r-fgsea
  r-ggplot2
  r-ggraph
  r-magrittr
  r-ontologyindex
  r-purrr
  r-recordlinkage
  r-stringr
  r-textclean
  r-tictoc
  r-tidygraph
  r-tidyr
  r-vroom
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggrepel
  r-kableextra
  r-knitr
  r-metabolomicsworkbenchr
  r-poma
  r-rmarkdown
  r-rvest
  r-summarizedexperiment
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fb36f18b53f474724998725801fcd2962a3446b90055d4690206e93e9003f8a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
