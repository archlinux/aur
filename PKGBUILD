# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Generifying and intuifying cross-platform omics analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-abind
  r-assertive.base
  r-assertive.files
  r-assertive.numbers
  r-assertive.sets
  r-biocfilecache
  r-biocgenerics
  r-bit64
  r-colorspace
  r-data.table
  r-dplyr
  r-edger
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-limma
  r-magrittr
  r-matrixstats
  r-multiassayexperiment
  r-pcamethods
  r-r.utils
  r-rappdirs
  r-readxl
  r-rlang
  r-s4vectors
  r-scales
  r-stringi
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-affy
  r-annotationdbi
  r-biocmanager
  r-biocstyle
  r-diagram
  r-genomicranges
  r-geoquery
  r-hgu95av2.db
  r-icsnp
  r-knitr
  r-lme4
  r-lmertest
  r-mixomics
  r-mpm
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rcurl
  r-remotes
  r-rmarkdown
  r-ropls
  r-rsubread
  r-rtracklayer
  r-seqinr
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9034c755764d54d8bf0eb0e330f4e54f')
b2sums=('ed49786ceee54208e06c3447dc00f6babcafbc68c339f2bbd2fabc632f9311a0173abf5ba7353f128d42f95710e3dfc25465a606ad1c889200e3132b4329ac57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
