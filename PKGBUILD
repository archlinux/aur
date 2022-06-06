# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggtreeExtra
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='An R Package To Add Geometric Layers On Circular Or Other Layout Tree Of "ggtree"'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggnewscale
  r-ggplot2
  r-ggtree
  r-rlang
)
optdepends=(
  r-ggstar
  r-knitr
  r-markdown
  r-patchwork
  r-prettydoc
  r-rmarkdown
  r-testthat
  r-treeio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8fd2055eefd3668ea88042dc1f25f2f962c0231abf25f808c7e126ec11970b0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
