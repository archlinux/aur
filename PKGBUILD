# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridSVG
_pkgver=1.7-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Export 'grid' Graphics as SVG"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-jsonlite
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e124e5dc04f30e8ea8eac84ff4671822')
b2sums=('6d68463f97438e2576d58cc66813dc8601a225a4ca34ab5960b37ef53e5500ac30bb5bf66509e9007463bbea34c7e27f55c9f531276e87a3a585a4cde3cdf9d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
