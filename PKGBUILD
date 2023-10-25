# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BEclear
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='Correction of batch effects in DNA methylation data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gcc
  r
  r-abind
  r-biocparallel
  r-data.table
  r-dixontest
  r-futile.logger
  r-ids
  r-rcpp
  r-rdpack
)
optdepends=(
  r-biocstyle
  r-knitr
  r-pander
  r-rmarkdown
  r-seewave
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1a7cd40872ecb94d5fe28d76f59c7d04489cda47675c53e4e9de1133aad12a9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
