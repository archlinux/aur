# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fda
_pkgver=6.1.4
pkgname=r-${_pkgname,,}
pkgver=6.1.4
pkgrel=1
pkgdesc='Functional Data Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-desolve
  r-fds
)
optdepends=(
  r-knitr
  r-lattice
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2818ecc0b78cb56b9b80fe21fc41502e49d58b57818ac52a70ba00d0f422515')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
