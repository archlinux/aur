# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=httr
pkgname=r-$_pkgname
pkgver=1.4.2
pkgrel=1
pkgdesc='Useful tools for working with HTTP organised by HTTP verbs (GET(), POST(), etc). Configuration functions make it easy to control additional request components'
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('GPL')
depends=('r' 'r-curl' 'r-jsonlite' 'r-mime' 'r-openssl' 'r-r6')
makedepends=('r-testthat')
optdepends=('r-covr' 'r-httpuv' 'r-jpeg' 'r-knitr' 'r-png' 'r-readr' 'r-xml2' 'r-rmarkdown')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('cbfb0569e7d61298645ce1cd569fdc3a25ef8ab07654523d001cd7b6292600c0baaf45be0b30fb2f692caed8e58367c4b6095914f5333ea5fb7c131df8931371')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership httr "$pkgdir"/usr/lib/R/library
}
