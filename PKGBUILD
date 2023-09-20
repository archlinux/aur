# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=caretEnsemble
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=1
pkgdesc='Ensembles of Caret Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-caret
  r-data.table
  r-digest
  r-ggplot2
  r-gridextra
  r-pbapply
  r-plyr
)
optdepends=(
  r-catools
  r-e1071
  r-gbm
  r-glmnet
  r-ipred
  r-kernlab
  r-klar
  r-knitr
  r-lintr
  r-mass
  r-mlbench
  r-nnet
  r-proc
  r-randomforest
  r-rmarkdown
  r-rpart
  r-sass
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9099e441211b29e17f7f5b521a3fc9e35be24cafa9bd8782a3eae2fb190aa391')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
