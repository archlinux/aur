# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=caretEnsemble
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=2.0.1
pkgrel=4
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
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e595e604ce2d9d32afbc5404e6fcbcd7f80e687316e9ca3303aca3e44c3ef88')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
