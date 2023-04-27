# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=npGSEA
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Permutation approximation methods for gene set enrichment analysis (non-permutation GSEA)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-gseabase
)
optdepends=(
  r-all
  r-biocstyle
  r-genefilter
  r-hgu95av2.db
  r-limma
  r-reportingtools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c4f215068b440589e1d59391f3e3972486e76a53e936497dc1d8582a5001599b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
