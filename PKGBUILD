# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sitadela
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the easy provision of simple but complete tab-delimited genomic annotation from a variety of sources and organisms"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biomart
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-txdbmaker
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-knitr
  r-rmarkdown
  r-rmysql
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('987e393b185f6952709bf59a9e09f72a')
b2sums=('14e424782a57a5d0db0f7d707949bb5d0422918c360be94244d11999bd9be8aad1f482ec06834a6a99bce5d598d830914acd1f1583f2bb69be49fd408054488c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
