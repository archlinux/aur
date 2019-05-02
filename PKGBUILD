# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=testit
_cranver=0.9
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-testit
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Provides two convenience functions assert() and test_pkg() to facilitate testing R packages.'
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL-2' 'GPL-3')
depends=('r')
optdepends=('r-rstudioapi')
source=("https://cran.r-project.org/src/contrib/Archive/${_cranname}/${_pkgtar}")
md5sums=('e19c52232a32060e86d8bef6f76b7d79')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}
        
