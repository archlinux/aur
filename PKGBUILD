# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ILoReg
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='ILoReg: a tool for high-resolution cell population identification from scRNA-Seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aricode
  r-cowplot
  r-dendextend
  r-desctools
  r-dorng
  r-dosnow
  r-dplyr
  r-fastcluster
  r-foreach
  r-ggplot2
  r-liblinear
  r-paralleldist
  r-pheatmap
  r-plyr
  r-reshape2
  r-rspectra
  r-rtsne
  r-s4vectors
  r-scales
  r-singlecellexperiment
  r-sparsem
  r-summarizedexperiment
  r-umap
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e10f4966a40be5c385b19aa8a176e5f68a77b5ef53b7b7cf893d10730f9214ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
