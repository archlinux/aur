# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=stringi
_cranver=1.2.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stringi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Character String Processing Facilities"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('custom')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('815e5ffc073eea5e10cf56a1af12facc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

