# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=TH.data
_cranver=1.1-0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="TH's Data Archive"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.5.0')
optdepends=(r-dplyr r-gdata r-plyr r-trtf r-tram r-rms r-coin r-atr r-multcomp r-gridextra r-vcd r-colorspace r-knitr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('21b37e251da5635ae91668f64b4c6f6a7ccedbe1f01af769d30fb532af83113e')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
