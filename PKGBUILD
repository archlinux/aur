# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNETgrate
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('fb3e503060d4294162e8690a6bb41059')
b2sums=('e662c423f300456f491ee92e7141c9782447b99c768885e983065f9d640d1905f88a84a04285916410669ca3959217761476bbd7f3a8e9e2871ac43d9d26ef59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
