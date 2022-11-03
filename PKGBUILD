# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=infinityFlow
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('8a6b80c6c963c14c815027c7651515447b84a1b2d413c47760927dac61e9750e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
