# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiffCorr
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=0.4.4
pkgrel=1
pkgdesc='Analyzing and Visualizing Differential Correlation Networks in Biological Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fdrtool
  r-igraph
  r-multtest
  r-pcamethods
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c729fe399aceaf3afb975777ff3483e5d557d9b55b33fe5803bdb8949ff33b17')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
