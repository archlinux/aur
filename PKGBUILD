# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scanMiR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-cowplot
  r-data.table
  r-genomicranges
  r-ggplot2
  r-iranges
  r-pwalign
  r-s4vectors
  r-seqinfo
  r-seqlogo
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('14f61cf322a9058b245279826751a312')
b2sums=('a8466d2e96c2343c771cd9965a2eb3570920ba9e6b3cca7bf11b3592e0193270554320ba231581c1beb09aded7c870566b2aa8a5f836409fccb9ade8d61c60ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
