# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NanoStringNCTools
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
sha256sums=('bd178073b6a638dc4da8a083f664c0e95829105c9e9b8d48640c5f7333a10b68')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
