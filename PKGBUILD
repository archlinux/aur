# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FLAMES
_pkgver=1.10.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Full Length Analysis of Mutations and Splicing in long read RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  bzip2
  curl
  r-bambu
  r-basilisk
  r-biocgenerics
  r-biostrings
  r-circlize
  r-complexheatmap
  r-cowplot
  r-dplyr
  r-dropletutils
  r-future
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-gridextra
  r-igraph
  r-iranges
  r-jsonlite
  r-magrittr
  r-multiassayexperiment
  r-rcolorbrewer
  r-reticulate
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scater
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-txdbmaker
  r-withr
  r-zlibbioc
  xz
  zlib
)
makedepends=(
  r-rcpp
  r-rhtslib
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-geoquery
  r-knitr
  r-markdown
  r-r.utils
  r-rmarkdown
  r-shortread
  r-testthat
  r-uwot
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25ace98ee5b53939615415685a153947')
b2sums=('0756518538a3fd8049d0623c04f7278753945a6a18a54de6dd3cfcf3a7baf7d06771db63a64c35b95c51031b223fe22c50bd5d3f1a4a8c7c4c51a13736f60080')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
