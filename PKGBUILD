# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FMStable
_pkgver=0.1-4
pkgname=r-${_pkgname,,}
pkgver=0.1.4
pkgrel=2
pkgdesc='Finite Moment Stable Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a391061dc2d2e89f6639aada07e839fdf950c0b20e27566219bb89befb4e93a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
