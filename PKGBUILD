# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORFik
_pkgver=1.28.0
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
md5sums=('a6d84a239a77233f88eff4608cb55b02')
b2sums=('2c6ac1b6b6b93143e39efeb7d93fb94e1e94a810c00ed6fc632e6fbea72937afda591db9bd14198922c83f11c9c2f61941ad200976a8ac1b8bb9932338eb1f77')

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
