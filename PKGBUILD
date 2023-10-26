# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhenoGeneRanker
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='PhenoGeneRanker: A gene and phenotype prioritization tool'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-doparallel
  r-dplyr
  r-foreach
  r-igraph
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bbf9959bbc8941ae1176a83797e32236e51ce0cfea87bc2ab19ee391fd6222a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
