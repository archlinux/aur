# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ILoReg
_pkgver=1.18.0
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
md5sums=('06eb150130f25ef9e6becfc9e33f833f')
b2sums=('0bc7e8ba72addb674f050f66e9e1180bbe50b787f07c6cfa0576c7f3027f167eb709767c7dc9be3e584021ac22fdf30ce0388516c0957b0b0abc380cf7ce3c67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
