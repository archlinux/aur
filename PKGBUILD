# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idr
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Irreproducible Discovery Rate"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3fcfef19b12cd9c0867fd607ab7ca5b')
b2sums=('74cf7fa749e436e1782e77af54101f3bf5508b6fecb0d6a8a343f0ba2b8a600a464c459f750a8a2e9c24422351cbeac2da12fc31ed2571e74d697da38f5cbf3d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
