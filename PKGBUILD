# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNETgrate
_pkgver=1.2.0
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
md5sums=('c82ba03d6eb152e07b4280a01bc6dfd0')
b2sums=('9516fda1a4c6367261d6477d74e936b21bdad87f994606e1ef95a5e3eb5db8a645bb85bed1ef6c6392d5e2a559abb49ed6e83b83bb869ca9f1a7d05687bfb9f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
