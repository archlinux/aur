# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biotmle
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Targeted Learning with Moderated Statistics for Biomarker Discovery'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biocgenerics
  r-biocparallel
  r-dplyr
  r-drtmle
  r-ggplot2
  r-ggsci
  r-limma
  r-s4vectors
  r-summarizedexperiment
  r-superheat
  r-tibble
)
optdepends=(
  r-arm
  r-biocstyle
  r-biotmledata
  r-dbi
  r-earth
  r-knitr
  r-matrix
  r-ranger
  r-rmarkdown
  r-superlearner
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65d9c41b1a3efffa4b06c5a4dad5f41d5801ae65462de13515a5a246178753c2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
