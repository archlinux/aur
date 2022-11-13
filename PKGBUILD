# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Creates Log Files'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC0')
depends=(
  r
  r-this.path
  r-withr
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidylog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d29da1f9afd3df1b5b85e86ca7c298d324a0cdb7a26e3717e4f2e8df1a176321')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
