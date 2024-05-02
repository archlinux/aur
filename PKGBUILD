# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=orthogene
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('8a18bbf6f3e76e84f3826bc815ddc4de676689ba566b25403e3cfef8654f2e8b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
