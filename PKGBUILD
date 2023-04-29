# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowCL
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=1.35.0
pkgrel=4
pkgdesc='Semantic labelling of flow cytometric cell populations'
arch=('any')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-graph
  r-rgraphviz
  r-sparql
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('48842e58df8ae0458185fafdc4dcf8aed72ac6805d6ba823b6a53e37ec07b9cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
