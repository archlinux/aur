# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetScore
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infer microRNA targets using microRNA-overexpression data and sequence information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-biobase
  r-geoquery
  r-gplots
  r-targetscoredata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6995aaae896369d4d34b9e2701463d83')
b2sums=('68f70482f723afea9ca70ebf0fceb04eb6b79f67069d554c2ec81bea89a02d2d9fff84f4aaddc6947a93d19ef9829faeaa1768d0b033460fb8fbfb12b8ee5588')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
