# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=npGSEA
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
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
sha256sums=('193f32d198f840ee184482969426c17c1f89a0eb3454a2bb30b07665bc3c38b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
