# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uSORT
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('8b7f443ab6586b86366ee5c76c8804b7defb2fa68613c59748fbfdc224e29ce1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
