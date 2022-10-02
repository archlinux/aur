# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=rvest
_cranver=1.0.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rvest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Harvest (Scrape) Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-glue' 'r-cli' 'r-httr>=0.5' 'r-lifecycle>=1.0.0' 'r-magrittr' 'r-rlang>=1.0.0' 'r-selectr' 'r-tibble'  'r-xml2>=1.3' 'r-withr' )
optdepends=(  'r-covr'  'r-knitr' 'r-readr' 'r-repurrrsive' 'r-rmarkdown'  'r-spelling'  'r-stringi>=0.3.1' 'r-testthat>=3.0.2' 'r-webfakes')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sums=('a465ef7391afaa3c26eebe8c61db02314ac04c4d8de5aa53f090716763d21c1e')

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
