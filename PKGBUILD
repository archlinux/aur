# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sccore
_pkgver=1.0.5
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
  r-rmumps
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9aed0f3a67614c35ee12a50c0b5acbaf')
b2sums=('903adac8e47187ea941f30c98c8e2cde539210179352ba540a9c3bbeb7dab68de1c637511522d07219d1c3a94bee98f0607d188102546de127d87581ae9001bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
