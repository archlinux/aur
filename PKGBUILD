# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=arrayQualityMetrics
_pkgver=3.64.0
pkgname=r-${_pkgname,,}
pkgver=3.64.0
pkgrel=1
pkgdesc='Quality metrics report for microarray data sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-affyplm
  r-beadarray
  r-biobase
  r-genefilter
  r-gridsvg
  r-hmisc
  r-hwriter
  r-latticeextra
  r-limma
  r-rcolorbrewer
  r-setrng
  r-svglite
  r-vsn
  r-xml
)
optdepends=(
  r-allmll
  r-biocstyle
  r-ccl4
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('97ee55cb23550099c6b71ade8e7e6aeaf82319f57cfcf05bf27a8ace0169e2cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
