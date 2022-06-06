# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maptpx
_pkgver=1.9-7
pkgname=r-${_pkgname,,}
pkgver=1.9.7
pkgrel=4
pkgdesc='MAP Estimation of Topic Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-slam
)
optdepends=(
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a720c8378cef7ae83158ae358c09ce1d2afd4ae8479a1f8cf83b97ccf7880539')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
