# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORFik
_pkgver=1.32.0
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
  r-qs2
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
  r-genomeinfodbdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0041f5dff4429c64f68039c8920032e1')
b2sums=('70ea4e55f535bd6c87bb7debfbcd13b8d8e2341e97fd43fcbe4cc948e3b9d7981c10e6ff2f7c4aafbde9c96310c54f6b83daeaca8fa665f7558862c82ec23d44')

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
