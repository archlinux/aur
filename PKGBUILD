# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>

_cranname=ggplot2
_cranver=3.3.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create Elegant Data Visualisations Using the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.2' r-digest r-glue 'r-gtable>=0.1.1' r-isoband 'r-rlang>=0.3.0' 'r-scales>=0.5.0' r-tibble 'r-withr>=2.0.0')
optdepends=(r-covr r-dplyr r-ggplot2movies r-hexbin r-hmisc r-knitr r-lattice r-mapproj r-maps r-maptools r-multcomp r-munsell r-profvis r-quantreg r-rcolorbrewer r-rgeos r-rmarkdown r-rpart r-sf r-svglite r-testthat r-vdiffr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('02d87290852410924eb816c2d4788afa')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
