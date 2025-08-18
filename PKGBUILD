# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.data
_pkgver=3.1-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for 'spatstat' Family"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-spatstat.utils
)
optdepends=(
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71ea3609127a0c3d6183ec5b3cd52d93')
b2sums=('4e10e9cbde651ed2a402bc92a5ccd3e93cfb1ad1f31056a6ca11c27d313ecf179c5aedefe81b5918fad24691ba415ac142010da9fbd4d8ac7f85460faaa219ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
