# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=abind
_cranver=1.4-5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-abind
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Combine Multidimensional Arrays"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('136f981e1c4f618b64a87faaa7797c97')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

