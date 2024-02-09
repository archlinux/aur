# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pvclust
_pkgver=2.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Hierarchical Clustering with P-Values via Multiscale Bootstrap Resampling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a505d8d67066442dfa9ec5cb2036b14d')
b2sums=('662fe8b0b11e7ce614fcada3aa2d6dc95659ce0cd88f68a8841e81dfc8a281e4d577e2905f1b2822710464e5099ffe4a24cc4ab45952e5b9dd191e56f23dca75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
