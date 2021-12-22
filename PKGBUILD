# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=cowplot
_cranver=1.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Streamlined Plot Theme and Plot Annotations for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.5.0' 'r-ggplot2>=2.2.1' r-gtable r-rlang r-scales)
optdepends=(r-cairo r-covr r-dplyr r-forcats r-gridgraphics r-knitr r-magick r-maps r-paswr r-patchwork r-rmarkdown r-ragg r-testthat r-tidyr r-vdiffr r-venndiagram)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('c7dce625b456dffc59ba100c816e16226048d12fdd29a7335dc1f6f6e12eed48')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
