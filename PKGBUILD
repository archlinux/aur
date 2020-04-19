# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=httr
pkgname=r-$_pkgname
pkgver=1.4.1
pkgrel=1
pkgdesc='Useful tools for working with HTTP organised by HTTP verbs (GET(), POST(), etc). Configuration functions make it easy to control additional request components'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-curl' 'r-jsonlite' 'r-mime' 'r-openssl' 'r-r6')
makedepends=('r-testthat')
optdepends=('r-covr' 'r-httpuv' 'r-jpeg' 'r-knitr' 'r-png' 'r-readr' 'r-xml2' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('708984effcec7603ebcbc2a2f81b57500887084a5144855921119e32bc1bb3a01c1871d3144fd34850bc771ef5fddc1ce9d40dd4bdc4325e01c7a4315a463641')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership httr "$pkgdir"/usr/lib/R/library
}
