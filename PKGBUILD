# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAinteract
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
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
sha256sums=('61a98e2818f83734b68eddaf6c7e3d0af3d938faacc7c49537d95380e4896c72')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
