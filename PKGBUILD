# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FLAMES
_pkgver=2.0.2
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
  r-spatialexperiment
  r-biocparallel
  r-scatterpie
  r-readr
  r-matrixgenerics
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
  r-r.utils
  r-rmarkdown
  r-shortread
  r-testthat
  r-uwot
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('169654a23c4ff538f5952294320398fa')
b2sums=('40284274e38e00ea736495b45a4bed461c1decb935bb27e056c7314de99add5abb03d2fc7af19ecfea314749a21cc32aa60f48f048a69d141a82cbfea7edadd3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
