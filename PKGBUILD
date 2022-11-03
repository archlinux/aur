# system requirements: jupyter, jupyter_kernel_test (Python package fortesting)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IRkernel
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
pkgrel=1
pkgdesc="Native R Kernel for the 'Jupyter Notebook'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-crayon
  r-digest
  r-evaluate
  r-irdisplay
  r-jsonlite
  r-pbdzmq
  r-repr
  r-uuid
  jupyterlab
)
optdepends=(
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3186e3a177c7246d45218af55f8b10836540e68a2d106858a0385f7d741b640c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
