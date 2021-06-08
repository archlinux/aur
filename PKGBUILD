# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=BIS
pkgname=r-bis
pkgver=0.2.1
pkgrel=1
pkgdesc="Provides an interface to data provided by the Bank for International Settlements, allowing for programmatic retrieval of a large quantity of (central) banking data."
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-dplyr' 'r-readr' 'r-tidyr' 'r-rvest' 'r-xml2')
makedepends=()
optdepends=('r-knitr' 'r-rmarkdown' 'r-ggplot2' 'r-zoo')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('c5bd657aa942a6793f9149ece9929f8f19ec9707fd093b49e8ccb1d666f4a39088057cda513c2b2474003615b0f15abe91a83eec3c028da0071dd6e9c8ab1b21')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
