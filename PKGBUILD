# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaBase
_pkgver=3.2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Class Unions, Matrix Operations, and Color Schemes for OOMPA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e2c352dade6e910134c0ca8651a80c0c')
b2sums=('73221aec5d1b32ece2ece69afd7127f565ffa97cb24c38cdc09d90cda97a6509e4476c154f13336f0d7a80836640bcecf9c789703e1ec93c7965e55e978ab29d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
