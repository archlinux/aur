# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=CVST
_cranver=0.2-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-cvst
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Fast Cross-Validation via Sequential Testing"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-kernlab')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('28ec6552375f73f791488449a85211dc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

