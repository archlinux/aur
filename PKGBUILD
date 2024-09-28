# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=exomePeak2
_pkgver=1.16.1
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
md5sums=('22545283967d3dc6c3362b2d2fe9ae27')
b2sums=('ac5c9c3eb7c0e202ed8c750c28a710d4699c4bf0f5cc8bba6fe4c3b6b1981765a116456445e1fb02e2a8293c8f28de3c9490490e98f65bdf89114c35b77a7197')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
