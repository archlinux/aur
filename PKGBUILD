# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra Analysis Results Data Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-cards
  r-cli
  r-dplyr
  r-glue
  r-lifecycle
  r-rlang
  r-tidyr
)
optdepends=(
  r-aod
  r-broom
  r-broom.helpers
  r-broom.mixed
  r-car
  r-effectsize
  r-emmeans
  r-geepack
  r-ggsurvfit
  r-lme4
  r-parameters
  r-smd
  r-survey
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9b9f1245bffa81c7e289d26953c10351')
b2sums=('7ceb9ce385592ca4a75fddcf3b0243523e3753635958e3a6dc14e2845c2c7e62f1c51bc9b3fefda9399acb6bd278e2cd5df971df2537d14521ccfc26f0274c44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
