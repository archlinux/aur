# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biocViews
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
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
sha256sums=('468407a4de1a6f1bae7f4b157baa5fcafd79cbebebf9e8e88bb871358aa250d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
