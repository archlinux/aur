# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=boa
_cranver=1.1.8-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-boa
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Bayesian Output Analysis Program (BOA) for MCMC"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a2391bcb7087201dc4e1de5d1ab97d2c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

