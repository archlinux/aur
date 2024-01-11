# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=demography
_cranver=2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Forecasting Mortality, Fertility, Migration and Population Data"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=('r>=3.4' 'r-forecast>=8.5' 'r-ftsa>=4.8' r-cobs r-mgcv r-strucchange 'r-hmdhfdplus>=2.0.0')
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(cdb946b1e3ec7c8146ebba7f25ab00617d42f7806d0c38cb67455d087774b36a)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
