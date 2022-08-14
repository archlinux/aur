# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waveslim
_pkgver=1.8.4
pkgname=r-${_pkgname,,}
pkgver=1.8.4
pkgrel=1
pkgdesc='Basic Wavelet Routines for One-, Two-, and Three-Dimensional Signal Processing'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-covr
  r-fftw
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('408eeea72a218ef3458f0934ff556733cacf1a63ddaa52491abcc1fce6ed2094')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
