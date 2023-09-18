# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mlogit
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multinomial Logit Models"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-dfidx
  r-formula
  r-lmtest
  r-rdpack
  r-statmod
  r-zoo
)
optdepends=(
  r-aer
  r-car
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-texreg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08c4273d0762bd0044cf6677c927df9b')
sha256sums=('6f3ea97db410be929a3078422f3d354d2f17855a21bbdc7c2c09d901e233d143')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
