# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RobustRankAggreg
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Methods for Robust Rank Aggregation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('76c896a3ebc71bcab67a43e87e716ee8')
b2sums=('cde1235f4aa95bd633d5e3247228abb35356c7739f6839b3bba33d074e43db48a9724f87f672209e019d7a791ad5b2011be4dcef72643c4be795159bdbd836ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
