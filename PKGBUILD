# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=kernlab
_cranver=0.9-26
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-kernlab
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Kernel-Based Machine Learning Lab"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c301c85f47c6673fddf6e211e8bcaeb1')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

