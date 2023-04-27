# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='scanMiR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biostrings
  r-cowplot
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggseqlogo
  r-iranges
  r-s4vectors
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('56af5ff0e920b09fb6d90d06b514a21ee2535b027eba4e0304dc1fdcd6385d87')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
