# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Synthesis of microarray-based classification'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-class
  r-corpcor
  r-e1071
  r-gbm
  r-glmnet
  r-limma
  r-mass
  r-mgcv
  r-mvtnorm
  r-nnet
  r-plsgenomics
  r-randomforest
  r-st
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('132ab3b7f827b6b44252dea47d8ebb6452020627192f763201e8cb97f34a097b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
