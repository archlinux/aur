# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTriangle
_pkgver=1.6-0.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Triangle - A 2D Quality Mesh Generator and Delaunay Triangulator"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC-BY-NC-SA-4.0')
depends=(
  r
)
optdepends=(
  r-geometry
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a55bc700b85159d5373a06e1816024d9')
b2sums=('57b70f2dbe79ec2111e982d34c3d0ff7c07cba151961bcefad18d8dbd4f91723f7a83d5cc5c03d0be93ba41d3735f2185226e57abef99eb4b453b998e5598576')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
