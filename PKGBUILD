# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=ecb
pkgname=r-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc="Provides an interface to the European Central Bank's Statistical Data Warehouse API, allowing for programmatic retrieval of a vast quantity of statistical data."
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-curl' 'r-rsdmx' 'r-xml2' 'r-httr')
makedepends=()
optdepends=('r-knitr' 'r-rmarkdown' 'r-dplyr' 'r-lubridate' 'r-ggplot2' 'r-testthat' 'r-zoo')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('461ada1748ee779e10555bf429c08c936e36ccf42f5a686abb5bfbe5897c8c276571cbefa98de645160b9c201c2d91690ac78583b7740dea917f735e49848c89')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
