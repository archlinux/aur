# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=isoband
_cranver=0.2.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Generate Isolines and Isobands from Regularly Spaced Elevation Grids"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r)
optdepends=(r-covr r-ggplot2 r-knitr r-magick r-microbenchmark r-rmarkdown r-sf r-testthat r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('46f53fa066f0966f02cb2bf050190c0d5e950dab2cdf565feb63fc092c886ba5')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
