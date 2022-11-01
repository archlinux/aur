# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=orthogene
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
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
  r-delayedmatrixstats
  r-dplyr
  r-genomeinfodbdata
  r-ggplot2
  r-ggpubr
  r-gprofiler2
  r-grr
  r-homologene
  r-jsonlite
  r-matrix.utils
  r-patchwork
  r-repmis
  r-ggtree
)
optdepends=(
  r-badger
  r-biocstyle
  r-covr
  r-here
  r-knitr
  r-markdown
  r-piggyback
  r-remotes
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('53d6e985f9621f812772c76538982ae946549dc06aa456eb448bb7481ffe7fb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
