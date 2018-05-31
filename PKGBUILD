# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=tnet
_cranver=3.0.14
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tnet
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Software for Analysis of Weighted, Two-Mode, and Longitudinal Networks"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-igraph')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('129a06065f7a0252f2fac3e5e6211f6e')
replaces=('r-cran-tnet')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

