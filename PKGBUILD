# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gap.datasets
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=0.0.6
pkgrel=1
pkgdesc="Datasets for 'gap'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e14b06fac203016555ddca323225ccf18d784609dbf9bdfff423e6dccd297cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
