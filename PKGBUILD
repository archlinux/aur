# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qPLEXanalyzer
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=1.19.0
pkgrel=1
pkgdesc='Tools for qPLEX-RIME data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biobase
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-ggdendro
  r-ggplot2
  r-iranges
  r-limma
  r-magrittr
  r-msnbase
  r-preprocesscore
  r-purrr
  r-rcolorbrewer
  r-readr
  r-rlang
  r-scales
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-gridextra
  r-knitr
  r-qplexdata
  r-rmarkdown
  r-statmod
  r-testthat
  r-uniprot.ws
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bef80119b82d994f2d5da4b73a546068af3a19bf67ee53981b5cb6090d898e27')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
