# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassSpecWavelet
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=3
pkgdesc='Mass spectrum processing by wavelet-based algorithms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
)
optdepends=(
  r-bench
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-signal
  r-waveslim
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c9769b599c5e9ac08b7c552bc2c459177c9632052ba53d4eeacb8e03307f0651')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
