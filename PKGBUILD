# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=highr
_cranver=0.8
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
md5sums=('59544c43d895df8ef8e6cbdfa5be9f73')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

