# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=cowplot
_cranver=1.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Streamlined Plot Theme and Plot Annotations for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.5.0' 'r-ggplot2>=2.2.1' r-gtable r-rlang r-scales)
optdepends=(r-cairo r-covr r-dplyr r-forcats r-gridgraphics r-knitr r-lattice r-magick r-maps r-paswr r-patchwork r-rmarkdown r-ragg r-testthat r-tidyr r-vdiffr r-venndiagram)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('30b941bd6b6d86d614489b18f42c01e8053c6e2d2b9caa167bd0a6d8c9bba511')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
