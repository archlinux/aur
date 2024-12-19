# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggstatsplot
_pkgver=0.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'ggplot2' Based Plots with Statistical Details"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-correlation
  r-datawizard
  r-dplyr
  r-ggcorrplot
  r-ggplot2
  r-ggrepel
  r-ggside
  r-ggsignif
  r-glue
  r-insight
  r-paletteer
  r-parameters
  r-patchwork
  r-performance
  r-purrr
  r-rlang
  r-statsexpressions
  r-tidyr
)
optdepends=(
  r-afex
  r-bayesfactor
  r-gapminder
  r-knitr
  r-lme4
  r-metabma
  r-metafor
  r-metaplus
  r-psych
  r-rmarkdown
  r-rstantools
  r-testthat
  r-tibble
  r-vdiffr
  r-withr
  r-wrs2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('207c703f6be2a0e9ae19f920a9b26135')
b2sums=('2beafe410bca06a266ea835c0aa9e4545161d1b8476268061fff4676659d679993c16b28afd47801ebb13c70cdf72b8f8bc21ba36b498d33a15e70f71e3d4fc0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
