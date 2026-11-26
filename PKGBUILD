# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAPanno
_pkgver=1.49.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotations for City of Hope CpG Island Analysis Pipeline"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f89fa8ad496867e3d110e406c9063c53')
b2sums=('e123fc4f26cef891457eddae9c3b5cb1ee5865c4ee62e78d4b9edc1d388b837d850d49b7e5aab72c3e69edd64d5010bd46a31643ea0598403e8699981e8b11d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
