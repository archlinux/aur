# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=gitcreds
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Query 'git' Credentials from 'R'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r git)
optdepends=(r-testthat r-knitr r-mockery r-oskeyring r-rmarkdown r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('373a010a46bb4b954be7ea4b4ac5c0fcdab0edd5ff100c1036965a1de721fd28')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
