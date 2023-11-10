# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=autonomics
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=1.10.2
pkgrel=1
pkgdesc='Generifying and intuifying cross-platform omics analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-assertive
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
  r-mass
  r-mixomics
  r-mpm
  r-nlme
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
sha256sums=('a9a63c09f9f4de533f92c8b82fa3f2821f532fd0edb4e5ba467d6fb327d30fb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
