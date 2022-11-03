# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocViews
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=1.66.0
pkgrel=1
pkgdesc='Categorized views of R package repositories'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biocmanager
  r-graph
  r-rbgl
  r-rcurl
  r-runit
  r-xml
)
optdepends=(
  r-biocgenerics
  r-commonmark
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4348fb91724ed6e83c21a4d616155d3740544c0ef8778a06429ed4c29f02f6e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
