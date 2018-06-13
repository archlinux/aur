# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=stringi
_cranver=1.2.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stringi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Character String Processing Facilities"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('custom')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('20ea105bdfb3577ac25b316c2274e1c7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

