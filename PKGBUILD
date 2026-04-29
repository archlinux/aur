# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSeqAn
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='R SeqAn'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d7ce08cb093bcfd4a4286acffe1beb905bf68b435fc8028596bd89a214b396d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
