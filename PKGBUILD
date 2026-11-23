# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Unified Statistical Modeling of Omics Data'
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-abind
  r-arrow
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
  r-lme4
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
  r-coin
  r-dbi
  r-diagram
  r-ensembldb
  r-genomicdatacommons
  r-genomicranges
  r-geoquery
  r-ggridges
  r-ggstance
  r-ggtext
  r-hgu95av2.db
  r-icsnp
  r-jsonlite
  r-knitr
  r-lmertest
  r-mclust
  r-mixomics
  r-mixtools
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
  r-testthat
  r-uniprot.ws
  r-writexl
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0303dc9d33cacbe341bafb42e374c39e')
b2sums=('c97507fefbaf8ce20e3bfc0d76465f089e404a42ab46538e8e340295bbccf07e02adcddb5e4dd1f9635e66f238d31835197efabafb38b026ccb3468bbe92d6db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
