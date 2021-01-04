# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=rlang
_cranver=0.4.10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions for Base Types and Core R and 'Tidyverse' Features"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.2.0')
optdepends=(r-cli r-covr r-crayon r-glue r-magrittr r-pillar r-rmarkdown r-testthat r-vctrs r-withr r-winch)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('07530270c4c199f2b7efc5d57a476d99babd9d0c3388a02bb7d57fe312da3576')
noextract=(${pkgname}-${pkgver}.tar.gz)

build() {
  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
