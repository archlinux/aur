# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccore
_pkgver=1.0.6
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
  r-seurat
)
makedepends=(
  r-rcpparmadillo
  r-rcppeigen
  r-rcppprogress
)
optdepends=(
  r-ggrastr
  r-jsonlite
  r-rmumps
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea4f657003a4a8105323e28b8d5a695d')
b2sums=('14385bc37afae1767896177a3be245b348e66a99d9ba08aeccb65efe051ca3d4c61fe232a8b16c2f22ca652a5a673984318d6743429ff6234bbfc6d2f08da422')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
