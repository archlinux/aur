# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=ggsci
_cranver=2.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Scientific Journal and Sci-Fi Themed Color Palettes for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.0.2' r-scales 'r-ggplot2>=2.0.0')
optdepends=(r-knitr r-rmarkdown r-gridextra r-reshape2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('4af14e6f3657134c115d5ac5e65a2ed74596f9a8437c03255447cd959fe9e33c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
