# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qcmetrics
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='A Framework for Quality Control'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-knitr
  r-pander
  r-s4vectors
  r-xtable
)
optdepends=(
  r-affy
  r-biocstyle
  r-ggplot2
  r-lattice
  r-msnbase
  r-mzr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ca3c05cf3ca600b4f04058387c85a0cc710fb2459faed248c204e043b2621ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
