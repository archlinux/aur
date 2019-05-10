# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=httr
pkgname=r-$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc='Useful tools for working with HTTP organised by HTTP verbs (GET(), POST(), etc). Configuration functions make it easy to control additional request components'
arch=('any')
url='https://cran.r-project.org/web/packages/httr/'
license=('GPL')
depends=('r' 'r-curl' 'r-jsonlite' 'r-mime' 'r-openssl' 'r-r6')
makedepends=('r-testthat')
optdepends=('r-covr' 'r-httpuv' 'r-jpeg' 'r-knitr' 'r-png' 'r-readr' 'r-xml2' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('aea5eeeb377f5abc8c07b8921b9df8081cf48356489ce5abe610f3f3f3a7caac76125bc56d05c17080bd571e22368551a632ca2383d3f05228c075de5f7fef3b')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership httr "$pkgdir"/usr/lib/R/library
}
