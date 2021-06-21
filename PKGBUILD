# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=FSA
_cranver=0.9.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simple Fisheries Stock Assessment Methods"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.5.0' r-car r-dplyr r-dunn.test r-lmtest r-plotrix r-sciplot r-withr)
optdepends=(r-desctools r-fishmethods r-fsadata r-knitr r-marked r-nlstools r-pkgdown r-plyr r-psych r-rcapture r-rmarkdown r-testthat r-tibble r-covr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d2e815efa8afcd3b61ddc3587b115a43ba7ec887a1a56f52caadf5973a8eaea7')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
