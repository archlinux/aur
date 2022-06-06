# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ILoReg
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
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
sha256sums=('8a26a0ab8812dd93e753e2998d5866d6b33d4a95d92d2a9e00cf418e64283f24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
