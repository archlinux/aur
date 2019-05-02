# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=openssl
_cranver=1.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-openssl
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc='Toolkit for Encryption, Signatures and Certificates Based on OpenSSL'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-askpass')
optdepends=('r-testthat' 'r-digest' 'r-knitr' 'r-rmarkdown' 'r-jsonlite' 'r-jose')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('b87ae13050afc27eca05785860b5e9db')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
