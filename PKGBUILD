# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=garfield
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GWAS Analysis of Regulatory or Functional Information Enrichment with LD correction"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df304cc8993496f4b44d05020afa4fea')
b2sums=('04dd4fbefa28b7f28e1cd496f968f99403d2daef46cb0a356f494ffb031580c81a72e8826f0218f45c9a0cae44e8ed751afd3a2f6d1ae12f2a2c1a5e6ef8dc8e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
