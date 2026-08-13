# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sitadela
_pkgver=1.20.0
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
md5sums=('3fa1ef86cdeeabba398725dcf3f8e327')
b2sums=('8d5d44cd18f573531d355570aaca36f8ee091de8491ed78950d7ecfa42da56f6f48b1838b54c1c0efa23848ef79ed18c9d4eb9b8e56163b2d5af527cd5d15251')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
