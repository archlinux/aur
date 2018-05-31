# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=scatterplot3d
_cranver=0.3-41
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-scatterplot3d
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="3D Scatter Plot"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('31455017f7c4b0722555453a1288f75c')
replaces=('r-cran-scatterplot3d')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

