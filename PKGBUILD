# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ILoReg
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('51a19f5568dc5d849d344000f82059b0087946e7d544bd1b7edb56242e224182')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
