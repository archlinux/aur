# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>

_cranname=ggplot2
_cranver=3.3.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create Elegant Data Visualisations Using the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.3' r-digest r-glue 'r-gtable>=0.1.1' r-isoband 'r-rlang>=0.4.10' 'r-scales>=0.5.0' r-tibble 'r-withr>=2.0.0')
optdepends=(r-covr r-ragg r-dplyr r-ggplot2movies r-hexbin r-hmisc r-interp r-knitr r-lattice r-mapproj r-maps r-maptools r-multcomp r-munsell r-profvis r-quantreg r-rcolorbrewer r-rgeos r-rmarkdown r-rpart r-sf r-svglite r-testthat r-vdiffr r-xml2)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b075294faf3af31b18e415f260c62d6000b218770e430484fe38819bdc3224ea')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
