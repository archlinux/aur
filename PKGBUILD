# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=granulator
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Rapid benchmarking of methods for *in silico* deconvolution of bulk RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-dtangle
  r-e1071
  r-epir
  r-ggplot2
  r-ggplotify
  r-limsolve
  r-magrittr
  r-nnls
  r-pheatmap
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba84848ead7ea99a4be9bf9697f3bde966d96038f5b9ccc6699c8d97d93c802f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
