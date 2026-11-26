# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALDEx2
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Analysis Of Differential Abundance Taking Sample Variation Into Account'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('custom')
depends=(
  r
  r-biocparallel
  r-directlabels
  r-genomicranges
  r-iranges
  r-latticeextra
  r-multtest
  r-rfast
  r-s4vectors
  r-summarizedexperiment
  r-zcompositions
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-ggpattern
  r-ggplot2
  r-knitr
  r-magick
  r-purrr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('467494cb42ae4b2b538d761c96060026fd090149b164a9497b428f69d634bb0e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
