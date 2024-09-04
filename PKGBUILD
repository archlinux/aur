# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=glmx
_pkgver=0.2-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Models Extended"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-formula
  r-lmtest
  r-sandwich
)
optdepends=(
  r-aer
  r-gld
  r-numderiv
  r-pscl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca1a5f86199bc61ac304dd873196d4ef')
b2sums=('f446dc601c095a621e936f804b816ad07a61f5cc169c9564ae15d1e8066842b2e3488d04240c4502cf7a679257d718882219b3701aa7857d6c0a2964b96f3be0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
