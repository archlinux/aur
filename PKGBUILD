# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=whisker
_cranver=0.3-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-whisker
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="{{mustache}} for R, logicless templating"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-markdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c4b9bf9a22e69ce003fe68663ab5e8e6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

