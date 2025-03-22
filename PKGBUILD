# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.14.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Unified Statistical Modeling of Omics Data'
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
  r-biobase
  r-e1071
  r-patchwork
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
md5sums=('22be85a3c5964354245ed2e3f66f22c0')
b2sums=('af501a8f62e346659a0fbd60f5d143365771a605ee1a088d45b73b2e15442a521789bb3a7ddb1d1ed788492274eae9981d8ce202022fa6ae7fc840de219ae1f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
