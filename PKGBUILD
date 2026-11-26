# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Nebulosa
_pkgver=1.24.0
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
md5sums=('63d11bd75d7d06181bd398e15aee6e39')
b2sums=('f1c3221586eebe0d1cb3a807282b184bea85b60f83340c84c4c3610c02732cb2f37db1310b21b8b8614bc5f64245c510c5bbe0a8987ebdd5dcfdb49b4697cef5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
