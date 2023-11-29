# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACCoGAPS
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Tools for scATACseq Data with CoGAPS"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-chromvar
  r-cogaps
  r-dplyr
  r-fgsea
  r-geneoverlap
  r-genomicfeatures
  r-genomicranges
  r-gplots
  r-gtools
  r-homo.sapiens
  r-iranges
  r-jaspar2016
  r-motifmatchr
  r-msigdbr
  r-mus.musculus
  r-projectr
  r-rgreat
  r-stringr
  r-tfbstools
  r-tidyverse
)
optdepends=(
  r-knitr
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f8cf8dd559b05caf23934090510297de')
sha256sums=('caaeb2de0ecf051edce19095d387547617d7d500ed606205293b029d364c2aed')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
