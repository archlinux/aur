# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=infinityFlow
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Augmenting Massively Parallel Cytometry Experiments Using Multivariate Non-Linear Regressions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-flowcore
  r-generics
  r-gtools
  r-matlab
  r-pbapply
  r-png
  r-raster
  r-uwot
  r-xgboost
)
optdepends=(
  r-e1071
  r-glmnetutils
  r-keras
  r-knitr
  r-rmarkdown
  r-tensorflow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df10959a650c1e4719774f886ac5576a0abfdc0527504f016709f3111eb75784')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
