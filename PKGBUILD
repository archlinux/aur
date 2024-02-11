# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathVar
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Methods to Find Pathways with Significantly Different Variability"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-data.table
  r-emt
  r-ggplot2
  r-gridextra
  r-matching
  r-mclust
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9583d61a6f6492567626bfac2baf9ced')
b2sums=('139edbbe77c3531c7172afe541b61093efc44d910b59a435474110657948c1a741831e384e9b917bddc26bccba548ac179b453ee69e761b5db43c2d1f19c9184')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
