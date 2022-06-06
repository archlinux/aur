# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=npGSEA
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('49888f67ea0141f9f320059d1ca70d292d8105552d4ee64d4d7304c0496b8916')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
