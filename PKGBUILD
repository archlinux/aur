# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polspline
_pkgver=1.1.24
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Polynomial Spline Routines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7425c2c2ac60df9780e13876a94de9b9')
b2sums=('5791eeb9a6008f5c5458996e54584b96eb8e093114fc9e837be8a8dbc1e48b291e595edd8c022501ba8ba2fea5d9db606af652301f6b608e45934176a1b87c30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
