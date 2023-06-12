# system requirements: Java Runtime Environment (>= 8)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RedeR
_pkgver=2.4.1
pkgname=r-${_pkgname,,}
pkgver=2.4.1
pkgrel=1
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
sha256sums=('d0243ff9a67b33c9c78c13278aa364b58a10b64be4e32da57c7b6a2c3c3690e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
