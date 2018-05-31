# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=base64enc
_cranver=0.1-3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-base64enc
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for base64 encoding"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0f476dacdd11a3e0ad56d13f5bc2f190')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

