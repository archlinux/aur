# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.14.9
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
md5sums=('a96f0d7aec7e57cabce980db286a5c64')
b2sums=('07a6d80a6d95b8ad568edb3b11961391eafbde318d195d797d9f5a0e5811776cf8e9e0e925f2644213304d45863f915cf0c3043c1ee723c39073de4307e31041')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
