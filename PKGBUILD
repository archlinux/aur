# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotationTools
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('eebb063635535037d5692cf86be2af69')
b2sums=('ce0d7f73231e1daf82230704c3cbdb0f33b19da14b964826ad92b32d18ad92469cceb16174c0dea19bed1d8d58dd17827b328d2efe05e753f8d9e29fa89e605a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
