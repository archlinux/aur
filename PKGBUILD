# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=spam
_cranver=2.8-0
_updatedate=2022-06-08
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
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d98177435b028d1c706d0197ea8132bfaffae6052c3ce6064a7f64178512d6aa')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
