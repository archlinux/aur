# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=gnumeric
_cranver=0.7-8
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-gnumeric
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read Data from Files Readable by gnumeric"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-xml')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('7293c0fe13280ae320dac355f6b10539')
replaces=('r-cran-gnumeric')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

