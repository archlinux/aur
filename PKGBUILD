# Contributor: krant <aleksey.vasilenko@gmail.com>

_cranname=tuneR
_cranver=1.3.3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Analysis of Music and Speech"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.0' 'r-signal')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('cdcbf04ab5b547002ee5b1d3bc46145882c5a551f164cac43df71596f1edd18a')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
