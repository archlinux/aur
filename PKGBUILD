# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridSVG
_pkgver=1.7-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Export 'grid' Graphics as SVG"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-jsonlite
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('49c9794b0600ad93903751eb9c6f5534')
b2sums=('b4d8fe9556d9535b5bfc465a98e25081e962530a1c34c3007980880b0d8c34eb0caf492a9ac9d339f3322aa02d11c72ad2ac5e15ece21be42eca3bf7b3bbb046')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
