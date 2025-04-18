# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tricycle
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='tricycle: Transferable Representation and Inference of cell cycle'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-circular
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-iranges
  r-rcolorbrewer
  r-s4vectors
  r-scater
  r-scattermore
  r-singlecellexperiment
  r-summarizedexperiment
  r-ggnewscale
)
optdepends=(
  r-biocstyle
  r-circstats
  r-cowplot
  r-htmltools
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('78dc49d9405ff3754eb003d7df8308c1b01203ad245752dbb077259d89e71e69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
