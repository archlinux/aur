# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=gtable
_cranver=0.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-gtable
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Arrange Grobs in Tables"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL2')
depends=('r' )

optdepends=('r-testthat' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('124090ae40b2dd3170ae11180e0d4cab')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

