# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sesame
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=1.22.2
pkgrel=1
pkgdesc='SEnsible Step-wise Analysis of DNA MEthylation BeadChips'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocfilecache
  r-biocparallel
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-illuminaio
  r-iranges
  r-preprocesscore
  r-readr
  r-reshape2
  r-s4vectors
  r-sesamedata
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-wheatmap
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-dnacopy
  r-e1071
  r-ggrepel
  r-grdevices
  r-kernsmooth
  r-knitr
  r-pals
  r-randomforest
  r-rmarkdown
  r-rpmm
  r-scales
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2d5c79ba1179e9dcfdb33de04489aeb7486e81bb91ff71a523b9c275e9935bb4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
