# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=km.ci
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=0.5.6
pkgrel=3
pkgdesc='Confidence intervals for the Kaplan-Meier estimator'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('81715339f9c711704b75c3507884904422e8d59cdd593121457abeb6e04e4ca3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
