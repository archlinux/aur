# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rprojroot
_cranver=2.0.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Finding Files in Project Subdirectories"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.0.0')
optdepends=(r-covr r-knitr r-lifecycle r-mockr r-rmarkdown r-testthat r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5fa161f0d4ac3b7a99dc6aa2d832251001dc92e93c828593a51fe90afd019e1f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
