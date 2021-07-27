# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=googlesheets4
_cranver=1.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-googlesheets4
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Access Google Sheets using the Sheets API V4"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.3' 'r-cellranger' 'r-cli>=3.0.0'  'r-curl' 'r-gargle>=1.2.0' 'r-glue>=1.3.0' 'r-googledrive>=2.0.0' 'r-httr' 'r-ids'  'r-magrittr' 'r-purrr' 'r-rematch2' 'r-rlang>=0.4.11' 'r-tibble>=2.1.1' 'r-vctrs>=0.2.3')

optdepends=('r-covr' 'r-readr' 'r-rmarkdown' 'r-sodium' 'r-spelling' 'r-testthat>=3.0.0' 'r-withr')
sha256sums=('0a107d76aac99d6db48d97ce55810c1412b2197f457b8476f676169a36c7cc7a')
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

