# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Motif2Site
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e8228f1deb42f2d4b3867a90a6eba14c')
b2sums=('e097ee487105a591cd2ca279e104c7235b6abfec99c3ea15631701e9d41d07bc1a3fe96a69c493f561f242e33eb284f13daaccd7c3e8dcf4ec8b452d1bc888f5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
