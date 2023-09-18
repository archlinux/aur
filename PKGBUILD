# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AER
_pkgver=1.2-10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Applied Econometrics with R"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
md5sums=('b421c70f87a06b6ffa2478944aabdd9c')
sha256sums=('650a5fb54a8addf8c86f1e0f88f4fac5349731bc5bf34762a991022140eedbdc')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
