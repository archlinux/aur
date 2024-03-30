# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNApath
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Pathway Enrichment for miRNA Expression Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94aad8a3b57b070cb5c559d9d1f14726')
b2sums=('2a893a2cda9f3e1c4b19c95d33290e7570d01fbcf3c97e0a4f11c8696a184480e925eb98cbb174e0f3d4e1900ed6c1d5b52670cd1587e7f7ee2c15076f7a2d26')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
