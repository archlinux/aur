# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.6.1
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
md5sums=('5c2234b3f554a369d9b2a600be9b6ff6')
b2sums=('1aef6e5029909c6fb43fa1d22ab4e4587c63b1b73e695d190c05b0b30b49148f15320ebfd190869d14b393d5c2e9672f6a0889f1ca3bda9a43088a3574e4aa1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
