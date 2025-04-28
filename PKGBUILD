# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNETgrate
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrates DNA methylation data with gene expression in a single gene network"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocstyle
  r-caret
  r-genomicranges
  r-glmnet
  r-gplots
  r-homo.sapiens
  r-igraph
  r-matrixstats
  r-minfi
  r-pigengene
  r-rfast
  r-summarizedexperiment
  r-tidyr
  r-tidyselect
  r-wgcna
)
optdepends=(
  r-annotationdbi
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-sesamedata
  r-tcgabiolinks
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46c2b19e59001967c7b1bab15441c88a')
b2sums=('b7f422d5827626f18c0bde19696563f25f917d1dada93a04404ddd47e12bd0a633ddddfe376193a067ea71734abcbd86bed3260abbb0ff7701bccb3868c7a1e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
