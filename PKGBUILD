# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified statistal Modeling of Omics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-abind
  r-biocfilecache
  r-biocgenerics
  r-bit64
  r-codingmatrices
  r-colorspace
  r-data.table
  r-dplyr
  r-edger
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-limma
  r-magrittr
  r-matrixstats
  r-multiassayexperiment
  r-r.utils
  r-rcolorbrewer
  r-readxl
  r-rlang
  r-s4vectors
  r-scales
  r-stringi
  r-summarizedexperiment
  r-tidyr
  r-tidyselect
  r-vsn
)
optdepends=(
  r-affy
  r-annotationdbi
  r-annotationhub
  r-apcluster
  r-biocmanager
  r-biocstyle
  r-biostrings
  r-dbi
  r-diagram
  r-ensembldb
  r-fpc
  r-genomicdatacommons
  r-genomicranges
  r-geoquery
  r-hgu95av2.db
  r-icsnp
  r-jsonlite
  r-knitr
  r-lme4
  r-lmertest
  r-mixomics
  r-mpm
  r-olinkanalyze
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pcamethods
  r-pheatmap
  r-progeny
  r-propagate
  r-rcurl
  r-readods
  r-remotes
  r-rmarkdown
  r-ropls
  r-rsqlite
  r-rsubread
  r-rtracklayer
  r-statmod
  r-survminer
  r-testthat
  r-uniprot.ws
  r-writexl
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('675d945e4fe04fc3977fbaf924876b0d')
b2sums=('b7d8fb4b2314b49fb32c8d779e478dfb7b5334252e7134b11d0edd6c7152bdb45c53db9e56992f18df2a807cf1384b42b26548efecb1ce604027f3375a5b3b9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
