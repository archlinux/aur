# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decontam
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Identify Contaminants in Marker-gene and Metagenomics Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-reshape2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-phyloseq
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7f76ff0904c73c0c7739d8bb0d913f0c0ffd7e0a9a8d32834dd6cfa61aa8cc46')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
