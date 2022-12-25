# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytext
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=0.4.0
pkgrel=1
pkgdesc="Text Mining using 'dplyr', 'ggplot2', and Other Tidy Tools"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-generics
  r-hunspell
  r-janeaustenr
  r-lifecycle
  r-purrr
  r-rlang
  r-stringr
  r-tibble
  r-tokenizers
  r-vctrs
)
optdepends=(
  r-broom
  r-covr
  r-data.table
  r-ggplot2
  r-knitr
  r-mallet
  r-nlp
  r-quanteda
  r-readr
  r-reshape2
  r-rmarkdown
  r-scales
  r-stm
  r-stopwords
  r-testthat
  r-textdata
  r-tidyr
  r-tm
  r-topicmodels
  r-vdiffr
  r-wordcloud
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3aadcdce641c83d47cb69ea504bbf34ea31fe628387d03c0d19a8d0e1279dfb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
