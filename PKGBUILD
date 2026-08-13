# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCAS
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA Centric Annotation System"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  pandoc
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-cowplot
  r-data.table
  r-dt
  r-genomation
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gprofiler2
  r-iranges
  r-knitr
  r-pbapply
  r-pheatmap
  r-plotly
  r-plotrix
  r-proxy
  r-ranger
  r-rmarkdown
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-seqlogo
  r-txdbmaker
)
optdepends=(
  r-biocmanager
  r-covr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c08a45aa587c7e33806e434fc361777')
b2sums=('b32bf4bee15538c819cde98bbed0b901b3ffb0a61f922dfffedaff5b296b7a330bdcdaf821701b25cc088b4fe7cb8169b80af820c4870f9aaedf0d10ad94cf00')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
