# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FLAMES
_pkgver=1.10.0
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
md5sums=('b4f8a2b352544fb940fcf3718956872f')
b2sums=('dfd4f5cc647abf971173b45968ab8862322bbe5b9d5322315abebedc44a748e6cc3e19291ecccda09adf1fe82107a323b697d662543378b78888198a767eaa03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
