# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGandMetacoreDzPathwaysGEO
_pkgver=1.27.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('04b3fade06e6d7fafbe3568a16abbd43')
b2sums=('f9c02235c64ff7b51bb5fdde57c19f5b6d33a2a951ee6a5a6d1aa7d6155ad739ddcf6965e35ef98d78625d79f031671a552652dddc40c1a1ee2f7d3427faf838')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
