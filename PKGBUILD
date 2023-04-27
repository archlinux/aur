# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uSORT
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='uSORT: A self-refining ordering pipeline for gene selection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-fpc
  r-gplots
  r-igraph
  r-monocle
  r-plyr
  r-rann
  r-rspectra
  r-vgam
  tk
)
optdepends=(
  r-ggplot2
  r-knitr
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b58c42d6c927fb9b1da26a153a6b4176ee262247156d0a869b5e06803220e57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
