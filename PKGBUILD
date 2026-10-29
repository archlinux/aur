# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sitadela
_pkgver=1.20.1
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
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-seqinfo
  r-txdbmaker
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-genomeinfodb
  r-knitr
  r-rmarkdown
  r-rmysql
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e32f3560136c33e74bdb51c1c372e3dc')
b2sums=('90c78068c5fe1d33e8e20d5a50557f7dc26264629540bce9f7bbbebd164ff5207e98ba0e58c3daaf933f0dfada8c19bbdf3d0c27ea9a0e488586388d1b9df4c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
