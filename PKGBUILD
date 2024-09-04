# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AER
_pkgver=1.2-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Applied Econometrics with R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-car
  r-formula
  r-lmtest
  r-sandwich
  r-zoo
)
optdepends=(
  r-dynlm
  r-effects
  r-fgarch
  r-forecast
  r-ineq
  r-longmemo
  r-mlogit
  r-np
  r-plm
  r-pscl
  r-quantreg
  r-rgl
  r-rocr
  r-rugarch
  r-sampleselection
  r-scatterplot3d
  r-strucchange
  r-systemfit
  r-truncreg
  r-tseries
  r-urca
  r-vars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a13da4bbfc87934bef11bc60c9c5f61')
b2sums=('7837038307e2418182f81f32773f752195b2fb905e5ca6a0cb59ef1c84ac85cee3b43b006c2500718dfe9ba0e7561227debc56ca9162a04c5a60a5a31ffc02b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
