# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Melissa
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('66e8b0c98a16936859eacd5d21c42fad7443a59412f3edb487e5a2e35c3be27f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
