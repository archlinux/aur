# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rugarch
_pkgver=1.4-9
pkgname=r-${_pkgname,,}
pkgver=1.4.9
pkgrel=1
pkgdesc='Univariate GARCH Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-chron
  r-ks
  r-numderiv
  r-rcpp
  r-rcpparmadillo
  r-rsolnp
  r-skewhyperbolic
  r-spd
  r-xts
  r-zoo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0fc11fe2435b5202bf299aee7be1078bfb994776020926326c0360aaddf7ea05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
