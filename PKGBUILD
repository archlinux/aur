# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Rank Constrained Similarity Learning for single cell RNA sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-igraph
  r-nbclust
  r-pracma
  r-rcppannoy
  r-rtsne
  r-umap
)
optdepends=(
  r-knitr
  r-mclust
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('014987c88b4b2941c8badfc38c37db2c')
b2sums=('0b445b6f5d9eb345fb443dda312c3b70c825098e2af32bbc34fde98f11fbf9444dead674acebdd98d538401a1fa47f50c013a767f8c637d35ef84f7abc4287ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
