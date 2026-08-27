# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crch
_pkgver=1.2-3
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
md5sums=('5cdc7f10704123e1f6ff23b5b5fc78bf')
b2sums=('734f6e86ef7ce428b986b117c845ef2004c9fdc5a4dfd2906d02fb7f3f14e1ec55218534b7d112a6b8d9b8e920375d8b1c1513f07e09b70cd86715c6749c5ee0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
