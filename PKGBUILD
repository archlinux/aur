# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=velociraptor
_pkgver=1.14.3
pkgname=r-${_pkgname,,}
pkgver=1.14.3
pkgrel=1
pkgdesc='Toolkit for Single-Cell Velocity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-basilisk
  r-biocgenerics
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-reticulate
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-zellkonverter
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-ggally
  r-ggplot2
  r-graphics
  r-grdevices
  r-knitr
  r-metr
  r-patchwork
  r-pkgdown
  r-rmarkdown
  r-rtsne
  r-scater
  r-scran
  r-scrnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a9946fd4b8bd9a01c3de53d64b2a53523c80b2014046eb0d56f86b9c8efc1345')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
