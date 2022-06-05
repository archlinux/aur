# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DepecheR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Determination of essential phenotypic elements of clusters in high-dimensional entities'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-beanplot
  r-dosnow
  r-dplyr
  r-fnn
  r-foreach
  r-ggplot2
  r-gmodels
  r-gplots
  r-matrixstats
  r-mixomics
  r-moments
  r-rcpp
  r-rcppeigen
  r-reshape2
  r-robustbase
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57e2bdb22b5ffb3c61640f0d8a8020b2dd3a91d1e62a0e0a53f715ddda673d66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
