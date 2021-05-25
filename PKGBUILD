# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=gargle
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-gargle
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Working with Google APIs"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.3' 'r-cli>=2.3.1' 'r-fs>=1.3.1' 'r-glue>=1.3.0' 'r-httr>=1.4.0' 'r-jsonlite' 'r-rappdirs' 'r-rlang>=0.4.9' 'r-rstudioapi' 'r-withr')
outdepends=('r-covr' 'r-httpuv' 'r-knitr' 'r-rmarkdown' 'r-mocker' 'r-sodium' 'r-spelling' 'r-testthat>=3.0.0')

sha256sums=('7ce429638a3e3286e78f801636b3671400c0ea1647a159fa4d7c91f27f4bc20f')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
