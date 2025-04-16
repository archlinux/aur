# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CFAssay
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical analysis for the Colony Formation Assay"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8719c95e9d02bcd52e30761ac3c38e0')
b2sums=('d701978b82080ab26434478f4c81f3c59b3f019ca83436708cadac1c3a5a8ee2f4433565768c49957f00c82fe85c524e37e1996ca4bc95dc3e044328d5f03f01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
