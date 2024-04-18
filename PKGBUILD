# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plgem
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Detect differential expression in microarray and proteomics datasets with the Power Law Global Error Model (PLGEM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('caa3e3fe048da49643b34bde9fcb834a')
b2sums=('cfd79cc6fae15028b1743edb89fc761a01c83b04ab4d65647f08b34090c152ed241c90b19b2a38a4e4214cea12b355e39ae0f6605b3ecef0d3fe8d38d221f3d9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
