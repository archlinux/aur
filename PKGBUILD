# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

_pkgname=hunspell
_pkgver=3.0.3
pkgname=r-${_pkgname,,}
pkgver=3.0.3
pkgrel=1
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
sha256sums=('fdaa1473a62dff2a5923b9bd958d87e546069ca22ce113f44e88c761338442f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
