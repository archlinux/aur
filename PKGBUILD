# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALDEx2
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
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
sha256sums=('7ec4afcf6be7b369aad32a81e02d7b12b0d98643a691529be052f9b5469a17af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
