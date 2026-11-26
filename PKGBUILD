# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proteinProfiles
_pkgver=1.54.0
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
md5sums=('53be298e007af41d45723c88f0ccade4')
b2sums=('87e570043c4cfb230237a453e418b5925cee3ef77c95938f6064e1eb530ee3028293a1902b86a7ac8d4e4f326d03deaee0bbdaa1847e6d419e04327d2ca0fcce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
