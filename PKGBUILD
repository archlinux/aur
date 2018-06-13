# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=SQUAREM
_cranver=2017.10-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-squarem
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Squared Extrapolation Methods for Accelerating EM-Like Monotone Algorithms"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-setrng')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('df052fd66b10f10780b34b3e5fa72f8e')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

