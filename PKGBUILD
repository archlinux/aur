# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GNET2
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Constructing gene regulatory networks from expression data through functional module inference'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-diagrammer
  r-dplyr
  r-ggplot2
  r-igraph
  r-matrixstats
  r-rcpp
  r-reshape2
  r-summarizedexperiment
  r-xgboost
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('deaf080cd9d2d45ad2716b8c3fccd5c5684912bd8f876b57ba252e07a16709e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
