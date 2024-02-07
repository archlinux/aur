# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCAS
_pkgver=1.28.3
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
)
optdepends=(
  r-biocmanager
  r-covr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed2c97bacd70c083df386e7df14d0c11')
b2sums=('c6c3f45c9d79bc3d71c67c2349fa1a7b85bb23d3322bd1036c7d60f41e3b00c5f03cd696d2d3076452aed0c0dc419c8d9df0a5593b03f9482160f7f53e6d0beb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
