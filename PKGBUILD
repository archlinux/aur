# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranver=1.3
pkgname=r-openssl
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Toolkit for Encryption, Signatures and Certificates Based on OpenSSL'
arch=('x86_64')
url='https://cran.r-project.org/package=openssl'
license=('MIT')
depends=('r' 'r-askpass')
optdepends=('r-testthat' 'r-digest' 'r-knitr' 'r-rmarkdown' 'r-jsonlite' 'r-jose')
source=("https://cran.r-project.org/src/contrib/openssl_"$_cranver".tar.gz")
md5sums=('b87ae13050afc27eca05785860b5e9db')

build(){
    R CMD INSTALL openssl_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership openssl "$pkgdir"/usr/lib/R/library
}

