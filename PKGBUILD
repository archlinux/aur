# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=gtsummary
_pkgver=2.5.1
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
md5sums=('747457d083116980d259eba325afd1bd')
b2sums=('0ecfd23b653f51c49287269df0b6a89cbf9e1c293c8fbc0ecf36dea6ce1a348b6243823b1cdd0c62744dfb39ae899a2640a822e22813e3de46bf811e2abedce9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
