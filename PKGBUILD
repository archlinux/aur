# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReorderCluster
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=4
pkgdesc='Reordering the dendrogram according to the class labels'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gplots
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a87898faa20380aac3e06a52eedcb2f0eb2b35ab74fdc3435d40ee9f1d28476b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
