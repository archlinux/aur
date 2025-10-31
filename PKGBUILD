# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=antiProfiles
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Implementation of gene expression anti-profiles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-locfit
  r-matrixstats
)
optdepends=(
  r-antiprofilesdata
  r-rcolorbrewer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3d54d5391d53938f594495229ee4a838')
b2sums=('4ddd3202ec7f1116cf81a8626ccb1c1237ba8a9fc0c87fd1e47e0fed9343404abd8e9c03375cf4825f7223516553a65ffd21839c6b89f7d374d7891710ab169d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
