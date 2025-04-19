# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsubread
_pkgver=2.22.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mapping, quantification and variant analysis of sequencing data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b43d11e328075a1a6f3fd38ca829f43f')
b2sums=('b04e0636fe9e88cf6761e03be9569a5fb3027375b4e328d67fc091eb5f553d9fba7dddd5ccd5b849847dba9d05805e24749e1a08409b931fe3de5545b387d539')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
