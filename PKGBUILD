# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=stargazer
_cranver=5.2.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stargazer
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Well-Formatted Regression and Summary Statistics Tables"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('2abae949aee14b373cd5c3024a63a2e8')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

