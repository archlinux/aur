# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNApath
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pathway Enrichment for miRNA Expression Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de003afd96c3d66099c10e7192a9bb92')
b2sums=('8f4acfa91b4600df006fe9917f1938d32f7941bfdef911af7b40da47e198ee2c3591d595d1432e0826ed47b7f4588c71b3cc7877363152ea5dac8fb64c16c935')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
