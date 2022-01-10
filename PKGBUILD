# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=lmom
_cranver=2.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="L-Moments"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(CPL1)
depends=('r>=3.0.0')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('cae2a925c39429d8e9f91bdb2682ea0d1343e9b2e5c9e8752c5929eb5f20d2d2')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
