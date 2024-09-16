# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crch
_pkgver=1.2-1
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
md5sums=('6d0bc3ca5619824c0eb216c5742c14d6')
b2sums=('07f3e5bfd4357417efab8b4a77aadf2ec974186b8ab624fef5d031357b7ceffd80edb354e51e3bb27b174167e05bd1375c510a8fb61e8e2837499bc10e390a12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
