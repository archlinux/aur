# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ILoReg
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a tool for high-resolution cell population identification from scRNA-Seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
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
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61adff20a5da2b5904280b6fca673407')
b2sums=('8544e401286bc86d12d78d384c3afcec28ad2fe31384c3d0aec9dceb8667e6a5cf5bfe0ce941ddb73bdbd154f856e971c5ee2f18c3ebc3e17e78de80d87e9e3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
