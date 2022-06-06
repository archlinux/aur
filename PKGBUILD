# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sRACIPE
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Systems biology tool to simulate gene regulatory circuits'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-ggplot2
  r-gplots
  r-gridextra
  r-htmlwidgets
  r-rcolorbrewer
  r-rcpp
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-umap
  r-visnetwork
)
optdepends=(
  r-biocstyle
  r-dofuture
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17cecbcc0e963cb7b47757394dcee618bf475e1c536dd350a7d5427c854ce460')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
