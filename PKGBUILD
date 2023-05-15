# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=apeglm
_pkgver=1.22.1
pkgname=r-${_pkgname,,}
pkgver=1.22.1
pkgrel=1
pkgdesc='Approximate posterior estimation for GLM coefficients'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-emdbook
  r-genomicranges
  r-rcpp
  r-rcppeigen
  r-rcppnumerical
  r-summarizedexperiment
)
optdepends=(
  r-airway
  r-deseq2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('477372ab998a0ef36da5992f140ec3bd08fb7a9a2430840235be0f3b2fac21a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
