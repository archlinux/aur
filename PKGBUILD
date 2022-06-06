# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=digitTests
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=5
pkgdesc='Tests for Detecting Irregular Digit Patterns'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-benford.analysis
  r-benfordtests
  r-beyondbenford
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbbe4e65197a8607e6f79efeb04288c1ebac0007581fce0fb104abb5bfd733e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
