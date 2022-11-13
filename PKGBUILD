# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netboxr
_pkgver=1.9.0
pkgname=r-${_pkgname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='netboxr'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-clusterprofiler
  r-data.table
  r-dt
  r-gplots
  r-igraph
  r-jsonlite
  r-plyr
  r-rcolorbrewer
)
optdepends=(
  r-biocstyle
  r-cgdsr
  r-knitr
  r-org.hs.eg.db
  r-paxtoolsr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f5e3138dcb82d4e70830383c1913bc234b796367d85ca2695742177280a936af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
