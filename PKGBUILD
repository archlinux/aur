# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=HMDHFDplus
_cranver=2.0.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read Human Mortality Database and Human Fertility Database Data from the Web"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=4.1' r-httr r-rvest r-dplyr r-janitor r-lubridate r-readr r-stringr r-tidyr r-rlang)
optdepends=(r-rcurl)
source=(https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(6784022c38b478b501707d3a27b6b7a11d152433e99760c33622ade627c0e9b3)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
