# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=rvest
_cranver=1.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rvest
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Easily Harvest (Scrape) Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-xml2>=1.3' 'r-lifecycle>=1.0.0'  'r-httr>=0.5' 'r-selectr' 'r-magrittr' 'r-rlang>=0.4.10' 'r-tibble' )

optdepends=( 'r-glue' 'r-testthat>=3.0.2' 'r-knitr' 'r-readr'  'r-stringi>=0.3.1' 'r-rmarkdown' 'r-repurrrsive' 'r-spelling' 'r-covr' 'r-webfakes')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sums=('0886245347b04ac3af1d2c5417bb4a9aa1ece5bb7f6e788b27fa1c20ee5d29ed')

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
