# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=StanHeaders
_cranver=2.17.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stanheaders
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="C++ Header Files for Stan"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('BSD')
depends=('r' )

optdepends=('r-bh')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('defb5a3bf4e429490ef34770b66410d4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

