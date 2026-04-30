# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Presentation-Ready Data Summary and Analytic Result Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cards
  r-cardx
  r-cli
  r-dplyr
  r-glue
  r-gt
  r-lifecycle
  r-rlang
  r-tidyr
  r-vctrs
)
optdepends=(
  r-aod
  r-broom
  r-broom.helpers
  r-broom.mixed
  r-car
  r-cmprsk
  r-effectsize
  r-emmeans
  r-flextable
  r-geepack
  r-ggstats
  r-huxtable
  r-insight
  r-kableextra
  r-knitr
  r-lme4
  r-mice
  r-officer
  r-openxlsx
  r-parameters
  r-parsnip
  r-rmarkdown
  r-smd
  r-spelling
  r-survey
  r-testthat
  r-withr
  r-workflows
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a64d44f70a93f71dec4c4115975a7048')
b2sums=('b65b7409f4ffe6f2e1bf00d1987673312a4bbd02270bcdce412ed1d2a093bc1c2b4e9611c44cd58e39467c96427adb7d4f08eb1ec26e1018ac101ee135d81d04')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
