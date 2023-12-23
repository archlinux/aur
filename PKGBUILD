# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rlab
_pkgver=4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Functions and Datasets Required for ST370 Class"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('37be3a8dbc0898ecd033f160c0123eb7')
b2sums=('ecf2568409f0da94eec1e1076757a1fcd66a6d7d827c46f16d7c9ea0aa6f2bc13ca6c3ad861d13ebe5ffb830b820f691cd4893985981c19949340e3f4c80ad08')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
