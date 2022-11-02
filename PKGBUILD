# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CoRegNet
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='CoRegNet : reconstruction and integrated analysis of co-regulatory networks'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-arules
  r-igraph
  r-shiny
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0792a1c0af85dc9eb252ec428753edbf1b252d176d15dbf8c46eb5acbe3a2b7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
