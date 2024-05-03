# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=traviz
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Trajectory functions for visualization and interpretation.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-ggplot2
  r-princurve
  r-rcolorbrewer
  r-rgl
  r-singlecellexperiment
  r-slingshot
  r-summarizedexperiment
  r-viridis
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-s4vectors
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c971742f7b8a64b00b260c4f0a8f76195d76ed1224872781899fedd11754dca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
