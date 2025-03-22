# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNETgrate
_pkgver=1.4.0
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
md5sums=('cb056d979ec3c5bea91f047f40cdd502')
b2sums=('5c091608c0b0fb86cdb57514e17b7b71d15a89996a3996252d75ae3ccb29db8625a0012ec727a4532a60022efa8065f384025b68568912daca12c54d4f6e72ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
