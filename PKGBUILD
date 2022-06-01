# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=ggpp
_cranver=0.4.4
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
sha512sums=('bb124c49154c7768c66ab2d49f3fa4d28b365ed2814d21ed26700fbe91462e5950a4b3e4232d6abf51f9607efd7b42e22e2eea2f29825050afad6f34d5a86509')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

