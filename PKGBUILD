# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=FSA
_cranver=0.9.1
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
sha256sums=('766196ccf3528d058822df7fbc10da731a3a6fe65cf90f1a3a1013cf99c94ca5')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
