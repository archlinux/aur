# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoCorrectoRGUI
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Graphical User Interface for IsoCorrectoR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-isocorrector
  r-readxl
  r-tcltk2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9953d5aa15a6c18f898f4533e83d395b0c7e2121d22f2f9fb0a6c5e0c14cd7c0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
