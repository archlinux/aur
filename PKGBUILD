# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crch
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Censored Regression with Conditional Heteroscedasticity"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-formula
  r-ordinal
  r-sandwich
  r-scoringrules
)
optdepends=(
  r-distributions3
  r-glmx
  r-lmtest
  r-memisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a34563d6831ca92c894669ba9020dc19')
sha256sums=('38a7a72fcbdcdc7a7a256e80b08f2213a8e3073acc091d175f3a141c11ae8ac7')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
