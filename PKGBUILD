# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccore
_pkgver=1.0.8
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
md5sums=('786b8fc6b84ea9bacc9fb5d10f0c121d')
b2sums=('1567207655fb60182e61f41608a46a041dd4bc373f0c73f9feea3766145eed31580d216c18c7b4071c836a1b6500a98d656c38e16dc96375e812e1811946fe10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
