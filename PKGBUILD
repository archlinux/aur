# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENIE3
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=3
pkgdesc='GEne Network Inference with Ensemble of trees'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-reshape2
)
optdepends=(
  r-biobase
  r-biocstyle
  r-doparallel
  r-dorng
  r-foreach
  r-knitr
  r-methods
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('13188afc7c87e60c6b2b10617ea28f9bd47f452a62890c1fa6ea6106316a512f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
