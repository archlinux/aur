# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=mime
_cranver=0.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mime
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Map Filenames to MIME Types"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('87e00b6d57b581465c19ae869a723c4d')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

