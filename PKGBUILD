# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crch
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-lmtest
  r-memisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a34563d6831ca92c894669ba9020dc19')
b2sums=('6c6f23005df72e34b2ba7cb336499ca8260ec5d7b0a3680a450df1d8fdc0ffb3c552749a3396ed8b65775a4593ce5196ea7e82905bb48e7e3e98ddf345cdcddb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
