# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap
_pkgver=1.14
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
  r-dot
  r-genetics
  r-haplo.stats
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
  r-valr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a7bc860c8d757401c0fdc2cbd75d234')
b2sums=('6f42280e1ef7484498a8702d66e9b6a140eb3eb3b1b48ef172d2174f339c5f8d4912660a5c71d797239c21bdff33d1ddce01129ed20423e18ed78397e2fa4022')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
