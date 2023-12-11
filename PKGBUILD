# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Motif2Site
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detect binding sites from motifs and ChIP-seq experiments, and compare binding sites across conditions"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
sha256sums=('04c6adcdc516e572a34c2842cb61b3929b1e9b97458cbd39260d047f874bc568')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
