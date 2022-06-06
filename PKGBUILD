# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=posterior
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=3
pkgdesc='Tools for Working with Posterior Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-abind
  r-checkmate
  r-distributional
  r-matrixstats
  r-pillar
  r-rlang
  r-tensora
  r-tibble
  r-vctrs
)
optdepends=(
  r-caret
  r-dplyr
  r-e1071
  r-gbm
  r-knitr
  r-randomforest
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b757e06885a1f21e7ad8f5a3feaecbe0a71ae8d766e4aec4c3aa2183a810afe1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
