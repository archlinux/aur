# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hunspell
_pkgver=3.0.1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=4
pkgdesc='High-Performance Stemmer, Tokenizer, and Spell Checker'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-digest
  r-rcpp
)
optdepends=(
  r-janeaustenr
  r-knitr
  r-pdftools
  r-rmarkdown
  r-spelling
  r-stopwords
  r-testthat
  r-wordcloud2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fedbb913bc13c790d2fabfe4edda0a987db3a078bea8c0ca9b777d20af08662')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
