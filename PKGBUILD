# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cMap2data
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Connectivity Map (version 2) Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9d53c236a9c4759d420576e0795f8813')
b2sums=('d801998ba35261c39bef5b2725d495b7510bba849ec6d44f5e1f93883182e6e148670408b2a3fcb16177375defc0075f1cd0c52c61fbab6f5dadda91b5a95b44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
