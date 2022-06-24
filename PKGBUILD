# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kriging
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=1
pkgdesc='Ordinary Kriging'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8238db37ba0efba2ec874a25b5738a0fa554800606b08486e94838710db0ce9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
