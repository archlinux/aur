# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=googledrive
_cranver=1.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-googledrive
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Manage Google Drive files from R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-curl>=2.8.1' 'r-gargle>=0.3.1' 'r-glue>=1.2.0' 'r-httr' 'r-jsonlite' 'r-magrittr' 'r-purrr>=0.2.3' 'r-rlang>=0.3.1' 'r-tibble>=2.0.0' 'r-uuid')

optdepends=('r-covr' 'r-dplyr' 'r-knitr' 'r-rmarkdown' 'r-roxygen2' 'r-sodium' 'r-spelling' 'r-testthat')
sha256sums=('9a06078e9e0d6949fcc2a3fb8583e975d73a033b5a34f064b2bcf6ec39a07e61')
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
