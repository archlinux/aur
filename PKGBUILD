# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crch
_pkgver=1.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Censored Regression with Conditional Heteroscedasticity"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-formula
  r-ordinal
  r-sandwich
  r-scoringrules
)
optdepends=(
  r-distributions3
  r-glmx
  r-knitr
  r-lmtest
  r-memisc
  r-quarto
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7894991ee27fc944f836fca567d8aff3')
b2sums=('dd9704aefad80d5f7006cd0059e1af11ac89ab444ceeaa441a72ccd50172063d1b07acf8255eff048f3875319a61fc1fa0a81a13ef6fee2ee02b6225aa8f4b68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
