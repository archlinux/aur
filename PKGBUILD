# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=backbone
_pkgver=3.0.2
pkgname=r-${_pkgname,,}
pkgver=3.0.2
pkgrel=1
pkgdesc='Extracts the Backbone from Graphs'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba4bcdbec6867a438ac9ad88c929a178805ea25bedb4860e9a72a9a8818a2f27')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
