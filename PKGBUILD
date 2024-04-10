# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytext
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
pkgdesc="Text Mining using 'dplyr', 'ggplot2', and Other Tidy Tools"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-dplyr
  r-generics
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
  r-hunspell
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
sha256sums=('0cf4180c2ab9fdb158337a7bfb6ba32f15fb61aae28abce425deaa5933ed2d54')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
