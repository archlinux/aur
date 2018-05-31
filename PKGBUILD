# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=highr
_cranver=0.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-highr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Syntax Highlighting for R Source Code"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-knitr' 'r-testit')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('bf47388c5f57dc61962362fb7e1d8b16')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

