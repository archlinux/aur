# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTriangle
_pkgver=1.6-0.14
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
md5sums=('825c3b440ab5d07c1e2b2dc91051ef24')
b2sums=('3b1cf4de94ecd3eada7103369d734062ebd50126a3ebd8e3f16c25269f2de15400c55d4d69a26ab328f36206e1d0974272904a706677e158f4de87ea076b5c3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
