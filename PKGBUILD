# system requirements: Java Runtime Environment (>= 8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RedeR
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=2.2.0
pkgrel=3
pkgdesc='Interactive visualization and manipulation of nested networks'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-treeandleaf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c087760d91c21a89c98428ffed5cdfea5c8edab1fd01fff30381c4ba58689645')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
