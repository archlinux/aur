# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MiChip
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="MiChip Parsing and Summarizing Functions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28daafdf6588314a9fad7a75b1671c10')
b2sums=('53724155400095c7c637ed833198dce994dc08e3e34839d553a8a08de7fdbb20d085d5cfe0ad71d56e35d91c4e348aa9ba35e41ba815bee75cfbc8835c6b7c23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
