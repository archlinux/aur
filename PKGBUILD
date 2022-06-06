# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Melissa
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Bayesian clustering and imputationa of single cell methylomes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biocstyle
  r-bprmeth
  r-cowplot
  r-data.table
  r-doparallel
  r-foreach
  r-genomicranges
  r-ggplot2
  r-magrittr
  r-matrixcalc
  r-mclust
  r-mcmcpack
  r-mvtnorm
  r-rocr
  r-truncnorm
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('70adcaeb95a290a28871260f50e03b115d09189c81dadb87fecf10e177428ea9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
