# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deldir
_pkgver=2.0-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Delaunay Triangulation and Dirichlet (Voronoi) Tessellation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-polyclip
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dba584ac3a3f26871618d7b2c0d2338a')
b2sums=('b22f62f04473314a44ab329d72c212eceb828615d3c46bbf2529800a1f28c8ebecefa3462f057bf9433978eb641074a960a29031045371fb833466328fe34c44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
