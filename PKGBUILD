# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRecover
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='scRecover for imputation of single-cell RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bbmle
  r-biocparallel
  r-doparallel
  r-foreach
  r-gamlss
  r-kernlab
  r-penalized
  r-preseqr
  r-pscl
  r-rmagic
  r-rsvd
  r-saver
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a28a6731bd0fd51db0560630ffb8a18875dec298cf3b48803700abf75974216')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
