# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=plot3Drgl
_cranver=1.0.3
_updatedate=2022-06-25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Plotting Multi-Dimensional Data - Using 'rgl'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.2.3' r-rgl r-plot3d)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('85421213e01e1b5f8b929ee1644232f37bacd723305e549c32850f6b6d6924a4')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
