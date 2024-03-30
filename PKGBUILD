# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mpmi
_pkgver=0.43.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Mixed-Pair Mutual Information Estimators"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('05858a74af0888bfc700c2ca3c6c050c')
b2sums=('8e20e384a05d91c68aee651d2de3937894179792a31898c449599778653ce5c99926c4a834916ff01216afb372fb4d4cc5440400b5f062b6678105ee80b5ba8d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
