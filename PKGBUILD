# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GENLIB
_pkgver=1.1.8
pkgname=r-${_pkgname,,}
pkgver=1.1.8
pkgrel=1
pkgdesc='Genealogical Data Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-bootstrap
  r-doparallel
  r-foreach
  r-kinship2
  r-quadprog
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93cd2f8aeba6d5ec95e4f113c2373981338a9ce7707e4503a2a46e0cbe237d7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
