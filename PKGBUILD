# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioPlex
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('6fea9a8a43be2f83c69cd9b1121563dd4ef83deef05bd83353a5d857f797fb3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
