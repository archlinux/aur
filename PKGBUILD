# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genphen
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='genphen: tool for quantification of genotype-phenotype associations in genome wide association studies (GWAS)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-doparallel
  r-e1071
  r-foreach
  r-ranger
  r-rcpp
  r-rpref
  r-rstan
)
optdepends=(
  r-ape
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-knitr
  r-reshape
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6805ee931998ad03305a3b56a3356502cb0519cf1bba2f3fe931eece9ec2c0d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
