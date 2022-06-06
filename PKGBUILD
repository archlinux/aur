# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparseMVN
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=0.2.2
pkgrel=4
pkgdesc='Multivariate Normal Functions for Sparse Covariance and Precision Matrices'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MPL2')
depends=(
  r
)
optdepends=(
  r-bookdown
  r-dplyr
  r-forcats
  r-ggplot2
  r-kableextra
  r-knitr
  r-mvtnorm
  r-scales
  r-testthat
  r-tidyr
  r-trustoptim
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e56c22e4bbf0960a4b912369550210163605d2bf6c1055524bdab05c093fa9ed')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
