# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maptpx
_pkgver=1.9-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="MAP Estimation of Topic Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('caffcd503c07fd413a460fb7832c9422')
b2sums=('0d14281af934f2bd49d10d60707a9afdd9353ef2b01b25de5c643db6e695f513f02c29f8ef578ab354a44774039fbd343a9ce7ac281c61a165bcc40f84cea114')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
