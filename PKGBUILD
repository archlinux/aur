# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGdzPathwaysGEO
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eb0423d267b1d24c31a31059a78d1f19')
b2sums=('a8d1cf39eff2c546323d0cb59a01dddd0652e59d6a34ce00de7e1ea454f948c4052ae25c449c5f6d05eb818a69d7ee95223f4a659867ddf94de485ad05e9aef7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
