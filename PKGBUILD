# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAinteract
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
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
sha256sums=('fbd73634b98baf6822ce9c3ba722f89f2e2e5685aea48e4d76b2193cebdd13b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
