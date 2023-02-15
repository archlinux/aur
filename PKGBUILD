# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=crunch
_cranver=1.30.1
_updatedate=2022-11-17
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Crunch.io Data Tools"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL)
depends=('r>=3.0.0' 'r-abind' 'r-crayon' 'r-curl' 'r-grdevices' 'r-httr>=1.0.0' 'r-httpcache>=0.1.4' 'r-jsonlite>=0.9.15' 'r-methods')
optdepends=('r-base64enc' 'r-covr' 'r-crunchy' 'r-devtools' 'r-haven' 'r-httptest>=3.0.0' 'r-knitr' 'r-lintr' 'r-magrittr' 'r-mime' 'r-rmarkdown' 'r-rstudioapi' 'r-spelling' 'r-styler' 'r-testthat>=2.0.0' 'r-withr')
source=(https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(deb1ecdcc50f62dec9d5cdd59c4a19245b69ea4accc46eff2c7de0a55ac309e3)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
