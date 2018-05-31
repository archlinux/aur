# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=random
_cranver=0.2.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-random
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="True Random Numbers using RANDOM.ORG"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL')
depends=('r' 'r-cran-curl')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0a642b1f4cd45f9eaa2ed34aa3f7df90')
replaces=('r-cran-random')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

