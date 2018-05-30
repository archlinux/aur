# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=dichromat
_cranver=2.0-0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-dichromat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Color Schemes for Dichromats"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('84e194ac95a69763d740947a7ee346a6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

