# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Motif2Site
_pkgver=1.12.0
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
md5sums=('186f607a24d6fe0ac2e8646d28f4cbe7')
b2sums=('b9b684d8d7ce75c0f3030f8fb4ae686ec5f73c071a4785a53846e2cd49450fd464e30a736a9a41eede012e8a1ab8c3ea7d03829a440045b1011127fc78c449fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
