# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioPlex
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='R-side access to BioPlex protein-protein interaction data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-geoquery
  r-graph
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-annotationhub
  r-biocstyle
  r-depmap
  r-experimenthub
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('00c044d3acbf5116d51978d905be48cf2dfd1deb1674da3bfcede15da547c820')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
