# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=koRpus
_pkgver=0.13-8
pkgname=r-${_pkgname,,}
pkgver=0.13.8
pkgrel=4
pkgdesc='Text Analysis with Emphasis on POS Tagging, Readability, and Lexical Diversity'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-sylly
)
optdepends=(
  r-knitr
  r-korpus.lang.de
  r-korpus.lang.en
  r-korpus.lang.es
  r-korpus.lang.fr
  r-korpus.lang.it
  r-korpus.lang.nl
  r-korpus.lang.pt
  r-korpus.lang.ru
  r-rkward
  r-rmarkdown
  r-shiny
  r-snowballc
  r-testthat
  r-tm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e9a4a332eeb33a0c9d0feab36ca1554ce5a3192717dc97a9ca3f011bf132a65')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
