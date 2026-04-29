# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fabia
_pkgver=2.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Factor Analysis for Bicluster Acquisition"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('83f5b836b9e29af24fba5fb796f72ea0')
b2sums=('28c3b2ae9484c3a4b70479a26f3f0f18447519a6353781792af326a548d86be4a462e623e558a06d2ca3965e67f34c7c8cefe381070e822ebf7b21c9079b18ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
