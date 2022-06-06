# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dynamicTreeCut
_pkgver=1.63-1
pkgname=r-${_pkgname,,}
pkgver=1.63.1
pkgrel=4
pkgdesc='Methods for Detection of Clusters in Hierarchical Clustering Dendrograms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('831307f64eddd68dcf01bbe2963be99e5cde65a636a13ce9de229777285e4db9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
