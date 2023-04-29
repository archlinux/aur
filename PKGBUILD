# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggtreeExtra
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=3
pkgdesc='An R Package To Add Geometric Layers On Circular Or Other Layout Tree Of "ggtree"'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cli
  r-ggnewscale
  r-ggplot2
  r-ggtree
  r-magrittr
  r-rlang
  r-tidytree
)
optdepends=(
  r-ggstar
  r-knitr
  r-markdown
  r-patchwork
  r-pillar
  r-prettydoc
  r-rmarkdown
  r-testthat
  r-treeio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('992de91ba77542f892842a9c99e18c77b5279a90bc8c7fdf1c00ea693c9db1a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
