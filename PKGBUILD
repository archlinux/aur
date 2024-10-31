# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matchBox
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities to compute, compare, and plot the agreement between ordered vectors of features (ie. distinct genomic experiments). The package includes Correspondence-At-the-TOP (CAT) analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb95c93ad0608089b8d5f3f3ad20d5d6')
b2sums=('72026962fbc37fcb14358896c0a3b40aa8e3c1e49f90555001097560aa499024063fac512d897903cd9fb0f137121f0d219ad1d1bd2bde475cd5a45cc1f8791c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
