# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('51c13cffb6a98ccbde33b585ebed43ca')
b2sums=('17f0c515a67c7440d6355e611939d475552a952be31f7097509e057ab9f7a787ecebe11eb833de3d00bf75be3d4abb89c446e33014af552f0e9a035c547a4ed5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
