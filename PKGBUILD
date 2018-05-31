# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=linkcomm
_cranver=1.0-11
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-linkcomm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Generating, Visualizing, and Analysing Link Communities in Networks"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-igraph' 'r-dynamictreecut')

optdepends=('r-fastcluster')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8bc5a1623c3db3d6c7072cf15ff67065')
replaces=('r-cran-linkcomm')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

