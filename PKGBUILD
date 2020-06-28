# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=ggpubr
_cranver=0.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'ggplot2' Based Publication Ready Plots"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=3.1.0' r-ggplot2 r-ggrepel r-ggsci r-tidyr r-purrr 'r-dplyr>=0.7.1' r-cowplot r-ggsignif r-scales r-gridextra r-glue r-polynom r-rlang 'r-rstatix>=0.6.0' r-tibble r-magrittr)
optdepends=(r-knitr r-rcolorbrewer r-gtable)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('707ceb412fe745c5a98260b51763131d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
