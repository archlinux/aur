# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=graper
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=1
pkgdesc='Adaptive penalization in high-dimensional regression and classification with external covariates using variational Bayes'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-cowplot
  r-ggplot2
  r-matrixstats
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('289f98548af9dee3e887c10a92682ef6355625c0745d46923b432b53baad497e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
