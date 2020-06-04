# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=ggrepel
_cranver=0.8.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Automatically Position Non-Overlapping Text Labels with 'ggplot2'"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.0.0' 'r-ggplot2>=2.2.0' r-rcpp 'r-scales>=0.3.0')
makedepends=(gcc)
optdepends=(r-knitr r-rmarkdown r-testthat r-gridextra r-devtools r-prettydoc)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('814fdf1271207a4435b8c1900a592fdb')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
