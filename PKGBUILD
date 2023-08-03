# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=vader
_cranver=0.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Valence Aware Dictionary and sEntiment Reasoner (VADER)"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=2.10' 'r-tm')
optdepends=('r-spelling')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(aea21e5feb67218b2596f517aa4a2c739ad740c2b30844896e60de477b994af6)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
