# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=gower
_cranver=0.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-gower
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Gowers Distance"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('015edef1ad21557bbb18751dd827fde4')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

