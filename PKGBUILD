# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=openssl
_cranver=1.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-openssl
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Toolkit for Encryption, Signatures and Certificates Based on OpenSSL"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-testthat' 'r-digest' 'r-knitr' 'r-rmarkdown' 'r-jsonlite' 'r-jose')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('f16b7b854787df75ff852704797b79c7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

