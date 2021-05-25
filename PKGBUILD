# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=googlesheets4
_cranver=0.3.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-googlesheets4
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Access Google Sheets using the Sheets API V4"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-curl>=2.8.1' 'r-gargle>=1.0.0' 'r-glue>=1.3.0' 'r-googledrive>=1.0.0' 'r-httr' 'r-ids' 'r-lifecycle' 'r-magrittr' 'r-purrr' 'r-rematch2' 'r-rlang>=0.3.1' 'r-tibble>=2.0.0' 'r-vctrs')

optdepends=('r-covr' 'r-readr' 'r-rmarkdown' 'r-sodium' 'r-spelling' 'r-testthat>=2.1.0' 'r-withr')
sha256sums=('621137d078d89a91f59e61a2be83f3bcfbef2e6db9c623b1485940f51b3b6111')
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

