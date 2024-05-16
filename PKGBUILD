# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROCit
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performance Assessment of Binary Classifier with Visualization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ae0b1be3445f98c2a35c5a8e91297be0')
b2sums=('6fc3b144a71065997d86f6074c9b1f9bce24e5839f6f67966df7375396a5b21d1f8b1fbd91b6271db44538dd71e14d4779cadcdf315fe8359a10c47db23b341f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
