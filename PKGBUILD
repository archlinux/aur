# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocViews
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=1.76.0
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
  r-biocstyle
  r-commonmark
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('396d266cc24b5527f3dd6d05eed2866358772476f510ab5eb076d324de92e294')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
