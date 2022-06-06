# system requirements: fftw3 (libfftw3-dev (deb), or fftw-devel (rpm))
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fftwtools
_pkgver=0.9-11
pkgname=r-${_pkgname,,}
pkgver=0.9.11
pkgrel=3
pkgdesc="Wrapper for 'FFTW3' Includes: One-Dimensional, Two-Dimensional, Three-Dimensional, and Multivariate Transforms"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  fftw
)
optdepends=(
  r-fftw
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f1f0c9a9086c7b2f72c5fb0334717cc917213a004eaef8448eab4940c9852c7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
