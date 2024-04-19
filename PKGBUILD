# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=crunch
_cranver=1.30.4
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
sha256sums=(d81f80fb93dc9807a619927385e73557021b488c9f07ba2b1714c00a0a277271)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
