# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RefPlus
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A function set for the Extrapolation Strategy (RMA+) and Extrapolation Averaging (RMA++) methods"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-affy
  r-affyplm
  r-biobase
  r-preprocesscore
)
optdepends=(
  r-affydata
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3735f75d63aa99ff38a34baef353836d')
b2sums=('53ae3f921140de99cdafb8642a902fdd8f981c18415789ed2e1b9e160184167ca5302677fd03e7a15889969947a1c0a4ad57dd8eb90e5df0aa1578b2c12ccd2b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
