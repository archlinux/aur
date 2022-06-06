# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SmartSVA
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=0.1.3
pkgrel=3
pkgdesc='Fast and Robust Surrogate Variable Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-isva
  r-rcpp
  r-rcppeigen
  r-rspectra
  r-sva
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d7925743d04bd52dee575a477cc7e8395fedb08f5dbb8427e61e3d6dbfd04881')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
