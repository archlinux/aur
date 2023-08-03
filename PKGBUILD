# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=RTextTools
_cranver=1.4.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Automatic Text Classification via Supervised Learning"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.6.0' 'r-sparsem' 'r-randomforest' 'r-methods' 'r-tree' 'r-nnet' 'r-tm' 'r-e1071' 'r-ipred' 'r-catools' 'r-glmnet' 'r-tau')
optdepends=()
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(ffd34254d07a2aad27d8dd5cfd877b3fc9ffa94771fd8e6c36609ac170dcb23b)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
