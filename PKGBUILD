# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sesame
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=3
pkgdesc='SEnsible Step-wise Analysis of DNA MEthylation BeadChips'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-dnacopy
  r-e1071
  r-fgsea
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-illuminaio
  r-iranges
  r-matrixstats
  r-preprocesscore
  r-randomforest
  r-reshape2
  r-s4vectors
  r-sesamedata
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-wheatmap
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-flowsorted.blood.450k
  r-flowsorted.cordbloodnorway.450k
  r-hdf5array
  r-illuminahumanmethylation450kmanifest
  r-knitr
  r-minfi
  r-rmarkdown
  r-scales
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('114806e010ccd1974db6c8326e304eaa85362887c4c1cbbf3c71a4140417fdd2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
