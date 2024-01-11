_cranname=StMoMo
_cranver=0.4.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Stochastic Mortality Modelling"
arch=(any)
url="https://github.com/amvillegas/StMoMo"
license=(GPL3)
depends=('r>=3.2.0' 'r-gnm>=1.0' 'r-forecast>=6.1' r-mass 'r-rootsolve>=1.6.5.1' 'r-fanplot>=3.4' 'r-reshape2>=1.4.1' 'r-fields>=8.2' r-rcolorbrewer)
makedepends=()
optdepends=(r-demography r-knitr r-xtable r-mts)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(84f802b5734d2cdcd0634a265841a04b0056baf81b2fc332233ee01be5139bb0)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
