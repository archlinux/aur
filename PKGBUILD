# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LPE
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for analyzing microarray data using Local Pooled Error (LPE) method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dba9c6a795a54f3fbe2262e9e21d7571')
b2sums=('dc75ced7331fd6c38959b966a593164730545edd0676be25418d233c5e9dc7e5e67235d94d6b0ba8787dbd9f9c3de735d215537b4f91f9a292fdc1a20242ce28')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
