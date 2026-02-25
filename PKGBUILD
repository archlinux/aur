# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=binr
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cut Numeric Values into Evenly Distributed Groups"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cb996bfc0e868cd8cb78e464c2d6dae')
b2sums=('7fffcbf35d30c6f9d6e118031f811137a38677d55b325863d3bf8a36c73ede9f02d2342e343f6b96ef123fc2f72448ab0f42772a72c3aa79945f0ab4a9673f87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
