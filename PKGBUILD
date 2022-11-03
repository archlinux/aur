# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNAinteract
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
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
sha256sums=('1ab4e29544214d97f9b3723461c3de8498160f65a3fc8be0dd7c3f82f99cd0a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
