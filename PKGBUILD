# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=gargle
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-gargle
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Working with Google APIs"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.5' 'r-cli>=3.0.0' 'r-fs>=1.3.1' 'r-glue>=1.3.0' 'r-httr>=1.4.0' 'r-jsonlite' 'r-rappdirs' 'r-rlang>=1.0.0' 'r-rstudioapi' 'r-withr')
optdepends=('r-aws.ec2metadata' 'r-aws.signature' 'r-covr' 'r-httpuv' 'r-knitr' 'r-rmarkdown' 'r-mocker' 'r-sodium' 'r-spelling' 'r-testthat>=3.1.2')

sha256sums=('f367e2c82f403167ae84058303a4fb0402664558a2abf0b495474a7ef1a2f020')
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
