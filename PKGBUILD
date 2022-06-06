# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoiClaClu
_pkgver=1.0.2.1
pkgname=r-${_pkgname,,}
pkgver=1.0.2.1
pkgrel=4
pkgdesc='Classification and Clustering of Sequencing Data Based on a Poisson Model'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd439983cae8b08f2e1e12100d80e705897b6858363cfeea8e51fceb2d5809e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
