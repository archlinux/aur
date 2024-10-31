# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReadqPCR
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read qPCR data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-qpcr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f14f25a5a7a20d73aff23a783fb6822')
b2sums=('05dc3fed1472801333fc713cc3b3f7a20f38dc452376d58234c7bcb90b8b77eebdff086fe867cd7199f0cd46d431eecec368109f16d91b39997cf218369c5460')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
