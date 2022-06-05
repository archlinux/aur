# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterRepro
_pkgver=0.9
pkgname=r-${_pkgname,,}
pkgver=0.9
pkgrel=4
pkgdesc='Reproducibility of Gene Expression Clusters'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('940d84529ff429b315cf4ad25700f93e1156ccacee7b6c38e4bdfbe2d4c6f868')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
