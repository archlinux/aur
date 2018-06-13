# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=foreach
_cranver=1.4.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-foreach
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides Foreach Looping Construct for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('Apache')
depends=('r' 'r-iterators')

optdepends=('r-randomforest')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('c397f4c76a92e52b6fca7f18cb2ee791')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

