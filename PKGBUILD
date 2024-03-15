# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqCNA.annot
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Annotation for the copy number analysis of deep sequencing cancer data with seqCNA"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a61df6e0824d7c3c3f4c697b5bd73e30')
b2sums=('ada8cf89cbb8e83dc15c4e801f31fdcae93882d2c525e627c41b63a19df5fd586e13edfcafaf5b637b00a9a4d77b7caf98887bda87009241d8f18956a3aa4a6c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
