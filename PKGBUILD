# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccore
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Core Utilities for Single-Cell RNA-Seq"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-igraph
  r-irlba
  r-magrittr
  r-pbmcapply
  r-proc
  r-rcpp
  r-rlang
  r-scales
  r-tibble
  r-uwot
  r-withr
)
makedepends=(
  r-rcpparmadillo
  r-rcppeigen
  r-rcppprogress
)
optdepends=(
  r-ggrastr
  r-jsonlite
  r-philentropy
  r-rmumps
  r-seurat
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5cfdb7d383d5e8ab6e8003aacc1193aa')
b2sums=('ab004932c9d67938a770e19bb0906a27e8e819e8f74bae8fda1fec6d24c3a9b0918c42ebeabc11819696700f554e7c002bdd666c328c9983c8c1ab1e8d519ffc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
