# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=RColorBrewer
_cranver=1.1-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rcolorbrewer
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="ColorBrewer Palettes"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('Apache')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('66054d83eade4dff8a43ad4732691182')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

