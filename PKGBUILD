# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iterativeBMAsurv
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=1.72.0
pkgrel=1
pkgdesc='The Iterative Bayesian Model Averaging (BMA) Algorithm For Survival Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bma
  r-leaps
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fe889accf8cdc14a097e4e0349eed362c142456b76c2eb740321aff861a97035')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
