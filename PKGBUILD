# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=infinityFlow
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('3bee2718eb4717450eab3ae3156c118dc94dd38aa58e42e628c4e70b53e2d7e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
