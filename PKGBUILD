# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BioPlex
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
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
sha256sums=('6823a72125b9976a157388a9f0720c419981951a593136466726c6f0dca06a06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
