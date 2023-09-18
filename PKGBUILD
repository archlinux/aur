# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mlmRev
_pkgver=1.0-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Examples from Multilevel Modelling Software Review"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4d61472c9dd70d0cfc7f31b8a046aa0')
sha256sums=('d57f3ff5d49e5f0079d4367cdbc1a273f48d8ce8f03bb82bb5f90606bfb2c452')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
