# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nebulosa
_pkgver=1.14.0
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
md5sums=('74449a659e99fe20595c0cf20a19cd3c')
b2sums=('5c9ecbb64e8fec57572b9ce131cd74a7e48d5eee1542d8725e05e5a7186a77dcdeac6725027ef1db89fedab98869902cbe8c54aebdd8965f26459f333aa4f81f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
