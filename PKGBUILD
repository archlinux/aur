# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=git2r
_cranver=0.21.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-git2r
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides Access to Git Repositories"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )

optdepends=('r-getpass')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4aceb139a7e60565c91cf0abf492ccf7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

