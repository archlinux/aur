# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=quanteda
_pkgver=3.3.0
pkgname=r-${_pkgname,,}
pkgver=3.3.0
pkgrel=1
pkgdesc='Quantitative Analysis of Textual Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastmatch
  r-jsonlite
  r-magrittr
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
  r-snowballc
  r-stopwords
  r-stringi
  r-xml2
  r-yaml
)
optdepends=(
  r-dplyr
  r-formatr
  r-ggplot2
  r-knitr
  r-lda
  r-lsa
  r-purrr
  r-quanteda.textmodels
  r-quanteda.textplots
  r-quanteda.textstats
  r-rcolorbrewer
  r-rmarkdown
  r-slam
  r-spacyr
  r-spelling
  r-stm
  r-testthat
  r-text2vec
  r-tibble
  r-tidytext
  r-tm
  r-tokenizers
  r-topicmodels
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('03256faf63455d16d643349a34b068d0bf69506a0e952b99ab2391e6423663a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
