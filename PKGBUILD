# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sitadela
_pkgver=1.16.0
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
md5sums=('7e02529ff9cfe0158cbf22d922e94809')
b2sums=('4c12a79cf9901d32033787cef4d2fb2a2dd76b58646ced7b3886c777f31e2f1b5ffcb8b6fa80e02a2625f3d9177abb3e17f9ea3ca3b4e71a28078c38f9629160')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
