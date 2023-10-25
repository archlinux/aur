# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneRecommender
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='A gene recommender algorithm to identify genes coexpressed with a query set of genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89202dd62cb18ff0a577ec8d38f72206d30ddaf90e39a1fecc8fa446399efef2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
