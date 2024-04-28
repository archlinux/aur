# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ODER
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Optimising the Definition of Expressed Regions'
arch=('any')
url="https://bioconductor.org/packages/3.17/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-biocgenerics
  r-dasper
  r-data.table
  r-derfinder
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-iranges
  r-magrittr
  r-megadepth
  r-plyr
  r-purrr
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-covr
  r-genomicfeatures
  r-knitr
  r-recount
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-summarizedexperiment
  r-testthat
  r-xfun
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c10abac4b8cf945a27916126f1ad0c034e53f65cd78ec118a2652f8da86839d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
