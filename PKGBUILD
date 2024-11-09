# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nebulosa
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-Cell Data Visualisation Using Kernel Gene-Weighted Density Estimation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-ggrastr
  r-ks
  r-patchwork
  r-seuratobject
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-covr
  r-dropletutils
  r-igraph
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7693058a1cf85b5d099559b2639cde2c')
b2sums=('8d192070e119c0241c0e7111b9af444b1545dfa91f9e0662f78513a9f31696c2a34518837a893f7e346ed6f7f76beccbec485c727211a0d67c5b21c48d8fef42')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
