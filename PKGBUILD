# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=rvest
_cranver=1.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rvest
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Easily Harvest (Scrape) Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r>=3.2' 'r-xml2>=1.3' 'r-lifecycle'  'r-httr>=0.5' 'r-selectr' 'r-magrittr' 'r-rlang>=0.4.10' 'r-tibble' )

optdepends=('r-testthat>=3.0.2' 'r-knitr'  'r-stringi>=0.3.1' 'r-rmarkdown' 'r-repurrrsive' 'r-spelling' 'r-covr''r-webfakes')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha256sums=('a358bf258a91b3362b3736fb5f957c12e98cddf21b6066fb2abdd26ecd665713')

build(){
cd "${srcdir}"
R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
cd "${scrdir}"
install -dm0755 "$pkgdir/usr/lib/R/library"
cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
