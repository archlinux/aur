# system requirements: kallisto
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BgeeCall
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=1.18.1
pkgrel=1
pkgdesc='Automatic RNA-Seq present/absent gene expression calls generation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-biostrings
  r-data.table
  r-dplyr
  r-genomicfeatures
  r-jsonlite
  r-rhdf5
  r-rslurm
  r-rtracklayer
  r-sjmisc
  r-tximport
)
optdepends=(
  r-annotationhub
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d3e3f426c28e2e03dff284bb974b6549a67fa26eff01ca2354d574ecfcbcfec6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
