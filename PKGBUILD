# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=S4Arrays
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Foundation of array-like containers in Bioconductor'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-crayon
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-sparsearray
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a0e9d7bdf9fecc2408c8a2c3b90cc40acb617714c15bba85bd361c1d06fcb16')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
