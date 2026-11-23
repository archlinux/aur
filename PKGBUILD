# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VIM
_pkgver=7.3.1
pkgname=r-${_pkgname,,}
pkgver=7.3.1
pkgrel=1
pkgdesc='Visualization and Imputation of Missing Values'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-data.table
  r-e1071
  r-laeken
  r-ranger
  r-rcpp
  r-robustbase
  r-sp
  r-vcd
  r-xgboost
)
optdepends=(
  r-car
  r-cellwise
  r-covr
  r-crmreg
  r-dplyr
  r-ecosolver
  r-enetlts
  r-future
  r-glmnet
  r-knitr
  r-lgr
  r-mice
  r-missranger
  r-mlr3
  r-mlr3learners
  r-mlr3pipelines
  r-mlr3tuning
  r-paradox
  r-pdist
  r-r6
  r-reactable
  r-rmarkdown
  r-robmixglm
  r-stringr
  r-tidyr
  r-tinytest
  r-validate
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8e7ece0819b811141eaef02cb8669e7724251eccc53375e9e10144010e4c549')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
