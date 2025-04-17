# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotationTools
_pkgver=1.82.0
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
md5sums=('4ea37f422007fba512a0dd3f8f1e9cbd')
b2sums=('4d8ae4dff23a2ba5fb71ac62a1159fe215cad1210064f4c9314d8721bc868c29df61cab9336efa64845b75b72731b2bec628fc95a92a7e94cf0cc11ac9770d5b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
