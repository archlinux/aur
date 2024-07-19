# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
_pkgname=cNORM
_pkgver=3.1.0
pkgname=r-${_pkgname,,}
pkgver=3.1.0
pkgrel=1
pkgdesc='Continuous Norming'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-latticeextra
  r-leaps
)
optdepends=(
  r-foreign
  r-knitr
  r-readxl
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3648400bed80d8ffeb3417b00812894f0c8244e940ca74a566856040fd159805')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
