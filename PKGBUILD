# system requirements: fftw3 (>= 3.1.2)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fftw
_pkgver=1.0-8
pkgname=r-${_pkgname,,}
pkgver=1.0.8
pkgrel=1
pkgdesc='Fast FFT and DCT Based on the FFTW Library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  fftw
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8c7e011666a0ed76e0554abfa62cf658c055bd6efebe94d16b4462d123d08620')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
