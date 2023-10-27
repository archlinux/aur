# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=orthogene
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Interspecies gene mapping'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-babelgene
  r-data.table
  r-delayedarray
  r-dplyr
  r-ggplot2
  r-ggpubr
  r-ggtree
  r-gprofiler2
  r-grr
  r-homologene
  r-jsonlite
  r-patchwork
  r-repmis
)
optdepends=(
  r-ape
  r-biocstyle
  r-genomeinfodbdata
  r-ggimage
  r-knitr
  r-magick
  r-markdown
  r-omadb
  r-phytools
  r-piggyback
  r-remotes
  r-rmarkdown
  r-rphylopic
  r-rworkflows
  r-testthat
  r-treetools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2872b0c24173b02dca976253f58310fe26bd5f3ad4bae2e02be19914405b824f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
