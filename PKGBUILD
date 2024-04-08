# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CodeDepends
_pkgver=0.6.6
pkgname=r-${_pkgname,,}
pkgver=0.6.6
pkgrel=1
pkgdesc='Analysis of R Code for Reproducible Research and Code Comprehension'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-xml
)
optdepends=(
  r-highlight
  r-knitr
  r-rcpp
  r-rcurl
  r-rgraphviz
  r-rjsonio
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7f815b03abe573b95ac9ed2e20caa7c5b5370aff710767e897575c2cf52c5857')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
