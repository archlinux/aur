# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ATACCoGAPS
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analysis Tools for scATACseq Data with CoGAPS"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
b2sums=('fba771859ac663cd14c4980a7de606db5c3562e0c473e98a404f5d7b32f58ac08fcbac35fe80a25d705275251403ef0f2d69b380bd817307d1eafbd9fdb3c3fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
