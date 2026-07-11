# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=glmx
_pkgver=0.2-3
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
md5sums=('2586a1e4458ea5537856af7b0f057416')
b2sums=('692fc2b525f285cf2efbd6ee0d76027295d3f911025489ccb4079943b24d38501e5118fed8ddb310d017abe952a895d763cc2e4c277f543f9d0eba9103e69330')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
