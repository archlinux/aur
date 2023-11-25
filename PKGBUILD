# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iNETgrate
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrates DNA methylation data with gene expression in a single gene network"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('f786fddd3c6b47a9626578326a84154fd6f6735fd7db789c04644f7522704ffd')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
