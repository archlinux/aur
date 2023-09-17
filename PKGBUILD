# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=effects
_pkgver=4.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Effect Displays for Linear, Generalized Linear, and Other Models"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-cardata
  r-colorspace
  r-estimability
  r-insight
  r-lme4
  r-survey
)
optdepends=(
  r-alr4
  r-betareg
  r-car
  r-heplots
  r-knitr
  r-ordinal
  r-pbkrtest
  r-polca
  r-robustlmm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cdcae07573da34746bfa4c246a6c4502')
sha256sums=('2fee322cee8f6eb634bcd54e7793a750c8196443cac176c6793ea854553a925a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
