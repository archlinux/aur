# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.5
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
md5sums=('f279851133eee35fd455426b833383bb')
b2sums=('6564c017f59ef9efcd81c946a9f05e005c487a5f4e50d8c69fdd0cb6c06d3c7e769793c1bf879a4cc9e2c57beb6e547252fb360da4cb7f8f020bfa90dcb230fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
