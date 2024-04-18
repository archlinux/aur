# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoStringNCTools
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='NanoString nCounter Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-ggbeeswarm
  r-ggiraph
  r-ggplot2
  r-ggthemes
  r-iranges
  r-pheatmap
  r-rcolorbrewer
  r-s4vectors
)
optdepends=(
  r-biovizbase
  r-ggbio
  r-knitr
  r-qpdf
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1aa0fccae5eafce5e3faa9c425e61440a181733f3d9853538cf9bb0b6862075')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
