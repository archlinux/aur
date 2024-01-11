# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=crunch
_cranver=1.30.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Crunch.io Data Tools"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=('r>=3.0.0' r-abind r-crayon r-curl r-grdevices 'r-httr>=1.0.0' 'r-httpcache>=0.1.4' 'r-jsonlite>=0.9.15' r-methods)
optdepends=(r-base64enc r-covr r-crunchy r-devtools r-haven 'r-httptest>=3.0.0' r-knitr r-lintr r-magrittr r-mime r-rmarkdown r-rstudioapi r-spelling r-styler 'r-testthat>=2.0.0' r-withr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(4b46864fa3b96c9a79ed05f40b4ca2383e7078020615501d7256817715d3a90f)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
