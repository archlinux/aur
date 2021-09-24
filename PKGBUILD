# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=ggpp
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extensions to 'ggplot2' respecting the grammar of graphics paradigm."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=('r>=3.6' 'r-ggplot2>=3.3.2' r-rlang r-magrittr r-glue r-gridextra r-scales r-tibble r-dplyr r-xts r-zoo r-polynom r-lubridate r-stringr)
optdepends=(r-knitr r-rmarkdown r-gginnards r-ggrepel r-magick)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('122ad3773ad2f33d85c2d81d9ce59d6761c32361a0b9d4fda71d778a67c25c54')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

