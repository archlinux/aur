# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioPlex
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc='R-side access to BioPlex protein-protein interaction data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocfilecache
  r-genomeinfodb
  r-genomicranges
  r-geoquery
  r-graph
  r-summarizedexperiment
)
optdepends=(
  r-annotationdbi
  r-annotationhub
  r-biocstyle
  r-depmap
  r-dexseq
  r-experimenthub
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('568a8cbfb38ca59e125f18669c95ce566a20a4c5183f2d446a6fcdc9fd4b2d24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
