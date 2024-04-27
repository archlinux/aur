# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dasper
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=3
pkgdesc='Detecting abberant splicing events from RNA-sequencing data'
arch=('any')
url="https://bioconductor.org/packages/3.17/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-basilisk
  r-biocfilecache
  r-biocparallel
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-iranges
  r-magrittr
  r-megadepth
  r-plyranges
  r-readr
  r-reticulate
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-annotationfilter
  r-biocstyle
  r-covr
  r-ensembldb
  r-genomicstate
  r-knitr
  r-lifecycle
  r-markdown
  r-recount
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9681cb5540f6a9fb3ed1e580152a5f165257174dc6a33b29b2c52b06086db424')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
