# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PLPE
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Local Pooled Error Test for Differential Expression with Paired High-throughput Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a4887a4c08676e0ce69331caacc297e')
b2sums=('a97859986d46d665381b99261c66ee7808287a0cc328c13e25fed0815951bbd4e1bf8ef153c301a0e4d1cadf44e9b8f66fcda9351be450b74ecd685c918f4866')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
