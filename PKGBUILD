# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SRAdb
_pkgver=1.58.1
pkgname=r-${_pkgname,,}
pkgver=1.58.1
pkgrel=1
pkgdesc='A compilation of metadata from NCBI SRA and tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-geoquery
  r-graph
  r-rcurl
  r-rsqlite
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('731195e8c971c5c2ee2e982c5ad588a401e95a4dd8d5e402241e7bf59302a984')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
