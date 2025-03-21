# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORFik
_pkgver=1.26.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Open Reading Frames in Genomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-biomartr
  r-biostrings
  r-bsgenome
  r-cowplot
  r-data.table
  r-deseq2
  r-fst
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-httr
  r-iranges
  r-jsonlite
  r-r.utils
  r-rcpp
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-txdbmaker
  r-withr
  r-xml
  r-xml2
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1a2c8f6a3d88637642f4cd5ade2214e6')
b2sums=('012f762fa66287eaa182e9dfe67333de2081401992b34e68b2c8ee2f7c1a7a5cc333650b30f55cb72cdf6c70ec514fc1e3ea1ea5f847348c9905f5ea4fb51afb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
