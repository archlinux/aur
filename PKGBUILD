# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rhdf5client
_pkgver=1.34.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access HDF5 content from HDF Scalable Data Service"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-delayedarray
  r-httr
  r-rjson
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e631f325ed42c0fcdda8e668afa933d')
b2sums=('a1f474064719a4ef30407250b679b044f6e512247bfe95a82300e4f6e191e430de7f6a2e63c196a902ee77b34074be9a5955aa20ef2a031bc1419df4aff7a075')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
