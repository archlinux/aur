# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=exomePeak2
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Peak Calling and differential analysis for MeRIP-Seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-deseq2
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-mclust
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-speedglm
  r-summarizedexperiment
  r-txdbmaker
)
optdepends=(
  r-biocmanager
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d505f936ac0a6e6baa89b2a8624bb74')
b2sums=('c80d039c80e139cde002f7f136e434e078aadbf3e457cbedebf4d95c6a8757b6b8df7a39a15fb87a02eadf9951ffee1d916dba9d701f6e310128c861ced7a806')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
