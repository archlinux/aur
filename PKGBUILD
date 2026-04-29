# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proteinProfiles
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Profiling"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a2a5d52c7a978b2bc64c87dfd90dc38')
b2sums=('235ffbc9276fbffabda6e58e6d1f64b76acf16556e55424539acc217d83e6b86731380efc604aafce4bd6640e701d013b4a517ee51d36a7e81e570c2b7404553')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
