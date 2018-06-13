# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=iterators
_cranver=1.0.9
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-iterators
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides Iterator Construct for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('Apache')
depends=('r' )

optdepends=('r-runit')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('93db840dc132b34dae8f7b79821a4b0f')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

