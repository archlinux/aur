# system requirements: C++11, Rtools (>= 3.1)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QUBIC
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='An R package for qualitative biclustering in support of gene co-expression analyses'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-biclust
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-fields
  r-knitr
  r-qgraph
  r-qubicdata
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52c3f513dc8de16d2c410c3b950a50c98906828715b0814b6d13636387be73f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
