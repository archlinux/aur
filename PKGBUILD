# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Motif2Site
_pkgver=1.16.0
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
md5sums=('a8e9dd25e270c7e940092767e36c668e')
b2sums=('887715938dd89483ae010a65a507487e53289c4357fc88e007674ac4ef7613016e5bc32d4cd6ef56dc9b555438af7e1b08bd4de722a91821d0bdc263308490ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
