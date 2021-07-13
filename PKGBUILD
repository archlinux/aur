# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
_cranname=googledrive
_cranver=2.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-googledrive
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Manage Google Drive files from R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.3' 'r-cli>=3.0.0' 'r-gargle>=1.2.0' 'r-glue>=1.4.2' 'r-httr' 'r-jsonlite' 'r-lifecycle' 'r-magrittr' 'r-purrr>=0.2.3' 'r-rlang>=0.4.9' 'r-tibble>=2.0.0' 'r-uuid' 'r-vctrs>=0.3.0' 'r-withr')

optdepends=('r-covr' 'r-curl' 'r-downlit' 'r-dplyr>=1.0.0' 'r-knitr' 'r-mockr' 'r-rmarkdown' 'r-roxygen2' 'r-sodium' 'r-spelling' 'r-testthat>=3.0.0')
sha256sums=('605c469a6a086ef4b049909c2e20a35411c165ce7ce4f62d68fd39ffed8c5a26')
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
