# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=tree
_cranver=1.0-43
_updatedate=2023-02-06
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Classification and Regression Trees"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.6.0')
optdepends=('r-mass')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(9b0a996d013cce4f457abdbdc54bd2f8f4dbe4ef0b33e0a53925509c509d5287)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
