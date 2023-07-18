# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SuperLearner
_pkgver=2.0-28.1
pkgname=r-${_pkgname,,}
pkgver=2.0.28.1
pkgrel=1
pkgdesc='Super Learner Prediction'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cvauc
  r-gam
  r-nnls
)
optdepends=(
  r-arm
  r-bartmachine
  r-biglasso
  r-bigmemory
  r-caret
  r-class
  r-devtools
  r-e1071
  r-earth
  r-extratrees
  r-gbm
  r-genefilter
  r-ggplot2
  r-glmnet
  r-ipred
  r-kernelknn
  r-kernlab
  r-knitr
  r-lattice
  r-logicreg
  r-mass
  r-mlbench
  r-nloptr
  r-nnet
  r-party
  r-polspline
  r-prettydoc
  r-quadprog
  r-randomforest
  r-ranger
  r-rhpcblasctl
  r-rmarkdown
  r-rocr
  r-rpart
  r-sis
  r-speedglm
  r-spls
  r-sva
  r-testthat
  r-xgboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('752f11b99816f8d61c1ff411ea4d5bec5509f2a655d250e58baa48e8a0266ba6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
