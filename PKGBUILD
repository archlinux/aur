# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geepack
_pkgver=1.3.11.1
pkgname=r-${_pkgname,,}
pkgver=1.3.11.1
pkgrel=1
pkgdesc='Generalized Estimating Equation Package'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-magrittr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a20c6c269e8da7cc6036c25b4832b7031ee6d6cce6d9ca5fa62fa1ae01785386')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
