# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotationTools
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Annotate microarrays and perform cross-species gene expression analyses using flat file databases"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b0a795d7898c0b6112ed596f9d2de27')
b2sums=('08671d131dc53e08886c29482c8a11a9f7a1470dbb111b9ee31c2a5619531a931c865696a4bce01a1171fd27f7e74fc0c1e6022e0fde8ec41b1cd63be16a8d20')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
