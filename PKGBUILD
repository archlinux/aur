# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.5-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genetic Analysis Package"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
  r-dot
  r-genetics
  r-haplo.stats
  r-htmlwidgets
  r-jsonlite
  r-kinship2
  r-knitr
  r-magic
  r-manhattanly
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
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69266dcc6a164090d5c0c9a22b3b839e')
sha256sums=('6e19f9d822460867fcb97fe917730ce0f87218893a6a7edae42caaa401b452ce')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
