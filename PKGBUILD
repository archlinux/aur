# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plm
_pkgver=2.6-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Panel Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bdsmatrix
  r-collapse
  r-formula
  r-lmtest
  r-maxlik
  r-rdpack
  r-sandwich
  r-zoo
)
optdepends=(
  r-aer
  r-car
  r-fixest
  r-knitr
  r-lfe
  r-pder
  r-rmarkdown
  r-statmod
  r-texreg
  r-urca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57da9057cb351e98cf3351074202af25')
b2sums=('5cd6220119e81c310a1c75305d46cdcc1f47da306a0ca59bf7737f2970b7ef24f0e8c1186044b9d3e53cc91342e87e74a795c8d171a1484891e88c50959e6fc8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
