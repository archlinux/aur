# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Motif2Site
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detect binding sites from motifs and ChIP-seq experiments, and compare binding sites across conditions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-mixtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.ecoli.ncbi.20080805
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b19397baf4e352f178fcd3812800112')
b2sums=('b414df7e8e1defeaa13cfc197c0f16aa561fe37cfa05abe26b1b436d2fe1e7ca12b3a413b03dd4b2e8c47eaeac6743e01c3f82befa20cd4f20b58f701dd8876b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
