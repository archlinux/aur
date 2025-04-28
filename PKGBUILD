# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsQC
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=2.26.0
pkgrel=1
pkgdesc='Longitudinal system suitability monitoring and quality control for proteomic experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-ggextra
  r-ggplot2
  r-msnbase
  r-plotly
  r-qcmetrics
)
optdepends=(
  r-knitr
  r-rforproteomics
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83470fabfcc7c21bfd53728c05c4a511dacb894d810fe8a56cae2784daedbf77')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
