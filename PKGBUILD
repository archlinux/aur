# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InvariantCausalPrediction
_pkgver=0.8
pkgname=r-${_pkgname,,}
pkgver=0.8
pkgrel=4
pkgdesc='Invariant Causal Prediction'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-glmnet
  r-mboost
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('542ecf1dacc153bca2d9c055da57f8650d4e8925aa850df2bcadd344e5f69305')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
