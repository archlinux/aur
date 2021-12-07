# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=spam
_cranver=2.7-0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="SPArse Matrix"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL2 BSD3)
depends=('r>=3.1' r-dotcall64)
makedepends=(gcc-fortran)
optdepends=(r-spam64 r-fields r-testthat r-r.rsp r-truncdist r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('632b5c48f587a34c997a487b72099c9c89d76a43f2cd9a36cb95fdec1d07850d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
