# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTriangle
_pkgver=1.6-0.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('c838779066e1dc9fd00e3cfe8377a08d')
b2sums=('4f6b371d1574497c421fc4e7d9119ba755070f343af85b8faec3c423e555c85332e427a821d0e0102189767ccdb0a2f16d9ed554216985acd651fff45ea094a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
