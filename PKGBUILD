# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=systemPipeTools
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Tools for data visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-deseq2
  r-dplyr
  r-dt
  r-ggally
  r-ggplot2
  r-ggrepel
  r-ggtree
  r-glmpca
  r-magrittr
  r-pheatmap
  r-plotly
  r-rtsne
  r-summarizedexperiment
  r-tibble
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biostrings
  r-knitr
  r-methods
  r-rmarkdown
  r-systempiper
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('92b25886cfa2590a0d576370f9e3aec76fffb99d20aa710cbbb061066436b14e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
