# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HEM
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Heterogeneous error model for identification of differentially expressed genes under multiple conditions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f52c32f90252e3ab3f1e7b73e51714e9')
b2sums=('c90529704acf41e4cf4dd344e291d6cb190de202592dd9b04d150021e802563dbb34a1fb79869c2b9893df3e90e274cbf2ad1bd99354fbcd47e694e76978240c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
