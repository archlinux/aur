# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.4
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
md5sums=('ea53317978d7acd59f39280826e77c54')
b2sums=('55d8e42c6e9c2a370b4fdd742eb9a7294c285c24e55eedea1fc2fc8095ec159caa8b14d316db414e359d8b2572f9e5610bc726af4dbcbcd1aa66d69d9f37be30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
