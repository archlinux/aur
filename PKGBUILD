# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.15.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genetic Analysis Package"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dplyr
  r-gap.datasets
  r-ggplot2
  r-plotly
  r-rdpack
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-bdsmatrix
  r-bookdown
  r-bradleyterry2
  r-calibrate
  r-circlize
  r-coda
  r-cowplot
  r-coxme
  r-diagrammer
  r-genetics
  r-haplo.stats
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-kinship2
  r-knitr
  r-magic
  r-matrixstats
  r-mcmcglmm
  r-meta
  r-metafor
  r-pedigree
  r-pedigreemm
  r-plotrix
  r-r2jags
  r-readr
  r-reshape
  r-rmarkdown
  r-rms
  r-scales
  r-valr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('054e74706124805d5ec52ca19d9b3186')
b2sums=('e13f194f8bd8e3c8376fca34764e1afcd3cf64375020d04208bf825c4cd6816d8b1767f6e347b3471e2c7da72af729cb636d66e68ab04c71c64b159e137c1d33')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
