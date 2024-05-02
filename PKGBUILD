# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNAnorm
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A normalization method for Copy Number Aberration in cancer samples"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-dnacopy
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca5a0d5b85b3d629a894699c7dd78d28')
b2sums=('6fa878c832177bac3ee4f164adc8a1f75ed44d749648a2a9ad780517a979b2fc9334a4a2f118f2aadea32722b2e4775deacc142df67690fb36a92eaaf682835b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
