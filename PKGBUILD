# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=magic
_cranver=1.5-8
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-magic
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create and Investigate Magic Squares"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-abind')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5a9e810f65e62e734879bdafd9754029')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

