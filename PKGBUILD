# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexclust
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Flexible Cluster Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-modeltools
)
optdepends=(
  r-clue
  r-ellipse
  r-seriation
  r-skmeans
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8450ecc8a0356f25509febf63c746762')
b2sums=('e0446cf8979085cbb0bc36c2cf747b1c0bd2d3611974a1a745137e3eb68487f3459e9872a8fb441efe5642cc7b3c531c9553bd4d9fb489ba90d6e7c11fe0b1a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
