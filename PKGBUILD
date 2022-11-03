# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GmicR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Combines WGCNA and xCell readouts with bayesian network learrning to generate a Gene-Module Immune-Cell network (GMIC)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-ape
  r-bnlearn
  r-category
  r-data.table
  r-doparallel
  r-dt
  r-foreach
  r-gostats
  r-grain
  r-grbase
  r-gseabase
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-reshape2
  r-shiny
  r-wgcna
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d5f9b0033f924ad7f3c681410e8fab81a31c683cebdd35a6ca6c0deab7494221')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
