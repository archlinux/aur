# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preciseTAD
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='preciseTAD: A machine learning framework for precise TAD boundary prediction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-caret
  r-dbscan
  r-dosnow
  r-e1071
  r-foreach
  r-genomicranges
  r-gtools
  r-iranges
  r-modelmetrics
  r-pbapply
  r-proc
  r-prroc
  r-randomforest
  r-rcgh
  r-s4vectors
)
optdepends=(
  r-bioccheck
  r-biocmanager
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e906b99a72b2fce84a7aa57993be02a64016cd38e9e6b072df0653b020a36af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
