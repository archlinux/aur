# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAinteract
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Estimate Pairwise Interactions from multidimensional features'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-abind
  r-biobase
  r-cellhts2
  r-geneplotter
  r-gplots
  r-hwriter
  r-ics
  r-icsnp
  r-latticeextra
  r-limma
  r-locfit
  r-rcolorbrewer
  r-splots
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('461c584ffad8507a8beed3f2b3c8dc816619abc979e0f3d28ce813d579785da2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
