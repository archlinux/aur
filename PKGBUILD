# system requirements: Java (>= 1.8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=debCAM
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Deconvolution by Convex Analysis of Mixtures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-apcluster
  r-biobase
  r-biocparallel
  r-corpcor
  r-dmwr2
  r-geometry
  r-nmf
  r-nnls
  r-pcapp
  r-rjava
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-rgl
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6791c0e29dcd9dfb3c4c831b074bf34ebb4557fcce6343301651d8c869c698eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
