# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=coda
_cranver=0.19-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-coda
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Output Analysis and Diagnostics for MCMC"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0d2aca6a5a3bdae9542708817c1ec001')
replaces=('r-cran-coda')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

