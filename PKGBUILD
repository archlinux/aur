# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('5a0ccf508e1ab679a2adfd19bb9b3b56')
b2sums=('91063752164a6896fb5c2f26c6dc08e7fb18d038183323a8e27510b9408db9a6e953217fbf7e58a7f24017289a24212e3687bc2231f22086e99a4d5db03d12f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
