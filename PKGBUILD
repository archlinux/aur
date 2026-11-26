# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fabia
_pkgver=2.60.0
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
md5sums=('8c6756021a3f55edd47f0d36a1116737')
b2sums=('2919754fe296a4aa0f4ec727556a8c88559baf9e3f0f34c933e783e2bb2514b636cdc2f830702efe7b727d33a1c1ddd81e1a80b9a770f505310602c412f707c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
